import { useEffect, useState } from "react";
import "./AdminPlatformSettingsPage.css";
type Mode="HIDDEN"|"EVERYONE"|"ID_EVEN"|"ID_ODD";
const choices:[Mode,string,string][]=[
 ["HIDDEN","Hidden","Do not show Gem balance in the public header."],
 ["EVERYONE","Everyone","Show it to every GYAN account."],
 ["ID_EVEN","GYAN ID ending Even","Stable A/B group from the final base-36 character."],
 ["ID_ODD","GYAN ID ending Odd","Stable A/B group from the final base-36 character."],
];
export default function AdminPlatformSettingsPage({onBack}:{onBack:()=>void}){
 const [value,setValue]=useState<Mode>("EVERYONE"),[loading,setLoading]=useState(true),[saving,setSaving]=useState(false),[message,setMessage]=useState("");
 useEffect(()=>{const c=new AbortController();void fetch("/api/admin/platform-settings",{credentials:"include",cache:"no-store",signal:c.signal}).then(async r=>{if(!r.ok)throw new Error();return await r.json() as {headerGemsVisibility?:Mode};}).then(b=>{if(!c.signal.aborted)setValue(b.headerGemsVisibility??"EVERYONE");}).catch(()=>{if(!c.signal.aborted)setMessage("Unable to load settings.");}).finally(()=>{if(!c.signal.aborted)setLoading(false);});return()=>c.abort();},[]);
 async function save(){setSaving(true);setMessage("");try{const r=await fetch("/api/admin/platform-settings",{method:"PATCH",credentials:"include",headers:{"content-type":"application/json"},body:JSON.stringify({headerGemsVisibility:value})});const b=await r.json() as {error?:string};if(!r.ok)throw new Error(b.error??"Unable to save settings.");setMessage("Saved. Refresh the public page to see it.");}catch(e){setMessage(e instanceof Error?e.message:"Unable to save settings.");}finally{setSaving(false);}}
 return <main className="admin-platform-settings"><header className="admin-platform-settings__header"><button type="button" onClick={onBack}>←</button><div><strong>Platform Settings</strong><small>Small switches · easy experiments</small></div></header><section className="admin-platform-settings__card"><div className="admin-platform-settings__heading"><div><strong>💎 Header Gem Balance</strong><small>Controls [GYAN] 💎¹²⁵ beside Learn • Discover • Grow.</small></div><span className="admin-platform-settings__preview">[3NQP] 💎<sup>125</sup></span></div>{loading?<div>Loading…</div>:<div className="admin-platform-settings__choices">{choices.map(([v,l,n])=><label key={v}><input type="radio" checked={value===v} onChange={()=>setValue(v)}/><span><strong>{l}</strong><small>{n}</small></span></label>)}</div>}<div className="admin-platform-settings__footer"><small>{message||"Even/odd uses the last GYAN-ID character as base 36."}</small><button type="button" disabled={loading||saving} onClick={()=>void save()}>{saving?"Saving…":"Save"}</button></div></section></main>;
}
