interface Env { gyan_registry: D1Database; RESEND_API_KEY?: string; }
interface OfferingRow {
  id:number; category:"IIT-JEE"|"NEET"; subject:string; topic:string; class_type:"DEMO"|"ACTUAL";
  weekday:number; start_ist:string; duration_minutes:number; program_start_date:string; program_end_date:string;
  teacher_name:string; teacher_education:string; teacher_experience:string; teacher_level:"BRONZE"|"SILVER"|"GOLD";
}

function json(body:unknown,status=200){return new Response(JSON.stringify(body),{status,headers:{"content-type":"application/json; charset=utf-8","cache-control":"no-store"}})}
function clean(value:unknown,max:number){return typeof value==="string"?value.trim().slice(0,max):""}
function validEmail(value:string){return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)}
function isoDate(date:Date){return [date.getUTCFullYear(),String(date.getUTCMonth()+1).padStart(2,"0"),String(date.getUTCDate()).padStart(2,"0")].join("-")}
function weekdayMondayOne(date:Date){const day=date.getUTCDay();return day===0?7:day}
function parseDate(value:string){const [y,m,d]=value.split("-").map(Number);return new Date(Date.UTC(y,m-1,d))}
function parseKey(value:string){const m=/^(\d+):(\d{4}-\d{2}-\d{2})$/.exec(value);return m?{offeringId:Number(m[1]),date:m[2]}:null}

async function offeringById(env:Env,id:number){
  return await env.gyan_registry.prepare(`
    SELECT o.id,o.category,o.subject,o.topic,o.class_type,o.weekday,o.start_ist,o.duration_minutes,o.program_start_date,o.program_end_date,
           t.display_name teacher_name,t.education teacher_education,t.experience teacher_experience,t.level teacher_level
    FROM class_offerings o JOIN class_teachers t ON t.id=o.teacher_id
    WHERE o.id=? AND o.active=1 AND t.active=1 LIMIT 1
  `).bind(id).first<OfferingRow>();
}

async function sendRegistrationEmail(env:Env,row:OfferingRow,date:string,name:string,email:string){
  if(!env.RESEND_API_KEY)return false;
  const subject=`GYAN Class Registration · ${row.category} · ${row.subject}`;
  const text=[`Hi ${name},`,"","Your GYAN class registration is confirmed.","",`${row.category} · ${row.subject}`,row.topic,`${date} · ${row.start_ist} IST · ${row.duration_minutes} minutes`,`Teacher: ${row.teacher_name} (${row.teacher_level})`,`Education: ${row.teacher_education}`,"","Joining details will be shared before the class.","","https://gyan.cc/class"].join("\n");
  try{
    const response=await fetch("https://api.resend.com/emails",{method:"POST",headers:{authorization:`Bearer ${env.RESEND_API_KEY}`,"content-type":"application/json"},body:JSON.stringify({from:"GYAN Classes <admin@gyan.cc>",to:[email],cc:email==="admin@gyan.cc"?undefined:["admin@gyan.cc"],subject,text})});
    if(!response.ok)console.error("Class registration email failed:",response.status,await response.text());
    return response.ok;
  }catch(error){console.error("Class registration email network error:",error);return false;}
}

export async function handleClassRoute({request,env,url}:{request:Request;env:Env;url:URL}):Promise<Response|null>{
  if(url.pathname==="/api/classes"&&request.method==="GET"){
    const category=clean(url.searchParams.get("category"),32).toUpperCase();
    const filtered=category==="IIT-JEE"||category==="NEET";
    const sql=`
      SELECT o.id,o.category,o.subject,o.topic,o.class_type,o.weekday,o.start_ist,o.duration_minutes,o.program_start_date,o.program_end_date,
             t.display_name teacher_name,t.education teacher_education,t.experience teacher_experience,t.level teacher_level
      FROM class_offerings o JOIN class_teachers t ON t.id=o.teacher_id
      WHERE o.active=1 AND t.active=1 ${filtered?"AND o.category=?":""}
      ORDER BY o.category,o.weekday,o.start_ist,o.subject`;
    const statement=filtered?env.gyan_registry.prepare(sql).bind(category):env.gyan_registry.prepare(sql);
    const result=await statement.all<OfferingRow>();
    const rows=result.results??[];
    const today=new Date();
    const base=new Date(Date.UTC(today.getFullYear(),today.getMonth(),today.getDate()));
    const classes:any[]=[];
    for(let offset=0;offset<21;offset+=1){
      const date=new Date(base.getTime()+offset*86400000); const dateKey=isoDate(date); const weekday=weekdayMondayOne(date);
      for(const row of rows){
        if(row.weekday!==weekday||dateKey<row.program_start_date||dateKey>row.program_end_date)continue;
        classes.push({occurrenceKey:`${row.id}:${dateKey}`,category:row.category,subject:row.subject,topic:row.topic,classType:row.class_type,occurrenceDate:dateKey,startIst:row.start_ist,durationMinutes:row.duration_minutes,teacher:{name:row.teacher_name,education:row.teacher_education,experience:row.teacher_experience,level:row.teacher_level}});
      }
    }
    return json({classes});
  }

  if(url.pathname==="/api/classes/register"&&request.method==="POST"){
    const body=await request.json<{occurrenceKey?:unknown;name?:unknown;email?:unknown;phone?:unknown}>();
    const parsed=parseKey(clean(body.occurrenceKey,80)); const name=clean(body.name,100); const email=clean(body.email,320).toLowerCase(); const phone=clean(body.phone,80);
    if(!parsed)return json({error:"Invalid class."},400);
    if(name.length<2||!validEmail(email))return json({error:"Name and valid email are required."},400);
    const offering=await offeringById(env,parsed.offeringId); if(!offering)return json({error:"Class is not available."},404);
    if(parsed.date<offering.program_start_date||parsed.date>offering.program_end_date||weekdayMondayOne(parseDate(parsed.date))!==offering.weekday)return json({error:"That class occurrence is not available."},400);
    const id=crypto.randomUUID();
    try{await env.gyan_registry.prepare(`INSERT INTO class_registrations(id,offering_id,occurrence_date,name,email,phone,status) VALUES(?,?,?,?,?,?,'REGISTERED')`).bind(id,offering.id,parsed.date,name,email,phone).run();}
    catch(error){const message=error instanceof Error?error.message.toLowerCase():"";if(message.includes("unique"))return json({error:"This email is already registered for this class."},409);throw error;}
    const emailSent=await sendRegistrationEmail(env,offering,parsed.date,name,email);
    return json({registered:true,registrationId:id,emailSent});
  }
  return null;
}
