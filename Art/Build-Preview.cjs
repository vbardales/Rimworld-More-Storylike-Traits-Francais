// Run with Node.js and playwright/sharp installed (NODE_PATH may select the bundled runtime).
const fs = require('fs'), path = require('path');
const {chromium} = require('playwright');
const sharp = require('sharp');
(async()=>{
 const root=path.resolve(__dirname,'..'), palette=JSON.parse(fs.readFileSync(path.join(__dirname,'preview-palette.json'),'utf8').replace(/^\uFEFF/,''));
 const about=fs.readFileSync(path.join(root,'Mod/About/About.xml'),'utf8');
 const version=about.match(/<supportedVersions>\s*<li>([^<]+)<\/li>/)[1];
 const source='data:image/png;base64,'+fs.readFileSync(path.join(__dirname,'Preview-source.png')).toString('base64');
 let html=fs.readFileSync(path.join(__dirname,'preview.html'),'utf8');
 for(const [k,v] of Object.entries({...palette,version,source}))html=html.replaceAll('{{'+k+'}}',v);
 if(/\{\{/.test(html))throw Error('Unresolved template value');
 const qa=path.join(root,'.build/preview-qa');fs.mkdirSync(qa,{recursive:true});
 const browser=await chromium.launch({headless:true,executablePath:process.env.CHROME_PATH || 'C:/Program Files/Google/Chrome/Application/chrome.exe'});
 try{
 const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});
 await page.setContent(html);await page.evaluate(async()=>{await document.fonts.ready;await Promise.all([...document.images].map(i=>i.decode()));});
 const boxes=await page.evaluate(()=>Object.fromEntries(['h1','h1 span','.tag','.summary'].map(s=>{const b=document.querySelector(s).getBoundingClientRect();return [s,{x:b.x,y:b.y,width:b.width,height:b.height}]})));
 const font=await page.evaluate(()=>({ready:document.fonts.status,family:getComputedStyle(document.querySelector('h1')).fontFamily,available:document.fonts.check('46px "Segoe UI"')}));
 const cdp=await page.context().newCDPSession(page);await cdp.send('DOM.enable');await cdp.send('CSS.enable');
 const doc=await cdp.send('DOM.getDocument');const heading=await cdp.send('DOM.querySelector',{nodeId:doc.root.nodeId,selector:'h1'});
 font.actual=(await cdp.send('CSS.getPlatformFontsForNode',{nodeId:heading.nodeId})).fonts;
 if(!font.actual.length || font.actual.some(f=>!f.familyName.includes('Segoe UI')))throw Error('Unexpected title font fallback');
 await page.screenshot({path:path.join(root,'Mod/About/Preview.png')});
 await page.addStyleTag({content:'.text,.version{visibility:hidden}'});
 const bg=await page.screenshot({path:path.join(qa,'background.png')});
 const {data,info}=await sharp(bg).removeAlpha().raw().toBuffer({resolveWithObject:true});
 const lum=rgb=>rgb.map(c=>c/255).map(c=>c<=.04045?c/12.92:((c+.055)/1.055)**2.4).reduce((a,c,i)=>a+c*[.2126,.7152,.0722][i],0);
 const rgb=h=>h.slice(1).match(/../g).map(s=>parseInt(s,16));
 const contrast=(a,b)=>(Math.max(a,b)+.05)/(Math.min(a,b)+.05);
 const ratios={};
 for(const [sel,b] of Object.entries(boxes)){let min=100;const fg=lum(rgb((sel==='.tag'||sel==='h1 span')?palette.inkSecondary:palette.inkPrimary));for(let y=Math.floor(b.y);y<Math.ceil(b.y+b.height);y++)for(let x=Math.floor(b.x);x<Math.ceil(b.x+b.width);x++){const i=(y*info.width+x)*info.channels;min=Math.min(min,contrast(fg,lum([...data.subarray(i,i+3)])));}ratios[sel]=min;}
 ratios.badge=contrast(lum(rgb(palette.badgeInk)),lum(rgb(palette.accent)));
 await sharp(path.join(root,'Mod/About/Preview.png')).resize(268).png().toFile(path.join(qa,'thumbnail.png'));
 const result={version,font,boxes,contrastMinimumOverWholeBoundingBoxes:ratios,bytes:fs.statSync(path.join(root,'Mod/About/Preview.png')).size};
 fs.writeFileSync(path.join(qa,'results.json'),JSON.stringify(result,null,2));console.log(JSON.stringify(result,null,2));
 if(Object.values(ratios).some(r=>r<4.5))throw Error('Contrast below 4.5:1');
 if(result.bytes>=1000000)throw Error('Preview too large');
 }finally{await browser.close();}
})().catch(e=>{console.error(e);process.exit(1)});
