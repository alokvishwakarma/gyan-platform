import { getAdminSession } from "./adminAuth";
type Env = Parameters<typeof getAdminSession>[1];
type Mode = "HIDDEN" | "EVERYONE" | "ID_EVEN" | "ID_ODD";
const KEY = "HEADER_GEMS_VISIBILITY";
function json(body: unknown, status=200){return new Response(JSON.stringify(body),{status,headers:{"content-type":"application/json; charset=utf-8","cache-control":"no-store"}});}
function mode(v: unknown): Mode | null {const x=typeof v==="string"?v.trim().toUpperCase():"";return ["HIDDEN","EVERYONE","ID_EVEN","ID_ODD"].includes(x)?x as Mode:null;}
async function current(env:Env):Promise<Mode>{const r=await env.gyan_registry.prepare("SELECT setting_value FROM platform_settings WHERE setting_key=? LIMIT 1").bind(KEY).first<{setting_value:string}>();return mode(r?.setting_value)??"EVERYONE";}
export async function handlePlatformSettingsRoute(request:Request,env:Env,url:URL):Promise<Response|null>{
 if(url.pathname==="/api/platform-settings/public"&&request.method==="GET")return json({headerGemsVisibility:await current(env)});
 if(url.pathname!=="/api/admin/platform-settings")return null;
 if(!await getAdminSession(request,env))return json({error:"Administrator authentication is required."},401);
 if(request.method==="GET")return json({headerGemsVisibility:await current(env)});
 if(request.method==="PATCH"){
  let b:{headerGemsVisibility?:unknown};try{b=await request.json() as typeof b;}catch{return json({error:"Invalid request body."},400);}
  const v=mode(b.headerGemsVisibility);if(!v)return json({error:"Invalid Header Gem Balance visibility."},400);
  await env.gyan_registry.prepare(`INSERT INTO platform_settings(setting_key,setting_value,updated_at) VALUES(?,?,CURRENT_TIMESTAMP) ON CONFLICT(setting_key) DO UPDATE SET setting_value=excluded.setting_value,updated_at=CURRENT_TIMESTAMP`).bind(KEY,v).run();
  return json({saved:true,headerGemsVisibility:v});
 }
 return json({error:"Method not allowed."},405);
}
