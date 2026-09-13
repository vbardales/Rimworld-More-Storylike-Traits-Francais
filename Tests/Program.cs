using MoreStorylikeTraits;
using RimWorld;
using Verse;
class Probe : ThoughtWorker_MSTSpecial { public bool Evaluate(Pawn p,Pawn o)=>CurrentSocialStateInternal(p,o).Active; }
class Fixture {
 public Pawn Pawn=new(), Other=new(); public TraitDef Match=new(), Unrelated=new(); public PawnCapacityDef Capacity=new(); public MSTModExtension Ext=new(); public Probe Worker=new();
 public Fixture(){Pawn.Faction=Other.Faction=new object();Ext.triggerTraits=new(){Match};Other.story.traits.allTraits.Add(new Trait{def=Match});Worker.def=new ThoughtDef{Extension=Ext};}
 public bool Run()=>Worker.Evaluate(Pawn,Other);
}
class Program {
 static int Main(){int passed=0,failed=0;
 void Test(string name,Action<Fixture> setup,bool expected){var f=new Fixture();try{setup(f);var actual=f.Run();if(actual!=expected)throw new Exception($"expected {expected}, observed {actual}");Console.WriteLine("PASS "+name);passed++;}catch(Exception ex){Console.WriteLine("FAIL "+name+": "+ex.Message);failed++;}}
 Test("known humanlike subject with matching active trait",f=>{},true);
 Test("missing extension safely inactive",f=>f.Worker.def.Extension=null,false);
 Test("null trigger list safely inactive",f=>f.Ext.triggerTraits=null,false);
 Test("empty trigger list safely inactive",f=>f.Ext.triggerTraits.Clear(),false);
 Test("nonhuman subject rejected before story access",f=>{f.Other.RaceProps.Humanlike=false;f.Other.story=null;},false);
 Test("unknown subject inactive",f=>f.Other.Known=false,false);
 Test("disfigurement excluded by default",f=>f.Other.Disfigured=true,false);
 Test("disfigurement explicitly allowed",f=>{f.Other.Disfigured=true;f.Ext.validWithDisfigured=true;},true);
 Test("same-faction requirement rejects different factions",f=>{f.Ext.sameFactionOnly=true;f.Other.Faction=new object();},false);
 Test("different factions allowed when unrestricted",f=>f.Other.Faction=new object(),true);
 Test("same faction accepted when required",f=>f.Ext.sameFactionOnly=true,true);
 Test("thinker capacity requirement rejects missing thinker capacity",f=>{f.Ext.requireCapacityOfPawn=f.Capacity;f.Pawn.health.capacities.Missing.Add(f.Capacity);},false);
 Test("subject capacity requirement rejects missing subject capacity",f=>{f.Ext.requireCapacityOfOther=f.Capacity;f.Other.health.capacities.Missing.Add(f.Capacity);},false);
 Test("subject capacity does not accidentally inspect thinker",f=>{f.Ext.requireCapacityOfOther=f.Capacity;f.Pawn.health.capacities.Missing.Add(f.Capacity);},true);
 Test("thinker capacity does not accidentally inspect subject",f=>{f.Ext.requireCapacityOfPawn=f.Capacity;f.Other.health.capacities.Missing.Add(f.Capacity);},true);
 Test("trait on thinker alone is insufficient",f=>{f.Pawn.story.traits.allTraits.Add(new Trait{def=f.Match});f.Other.story.traits.allTraits.Clear();},false);
 Test("unrelated trait does not activate",f=>f.Other.story.traits.allTraits[0].def=f.Unrelated,false);
 Test("gene-suppressed matching trait ignored",f=>f.Other.story.traits.allTraits[0].Suppressed=true,false);
 Test("later active match survives earlier suppressed match",f=>{f.Other.story.traits.allTraits[0].Suppressed=true;f.Other.story.traits.allTraits.Add(new Trait{def=f.Match});},true);
 Test("any matching trigger is sufficient",f=>f.Ext.triggerTraits.Insert(0,f.Unrelated),true);
 Console.WriteLine($"Worker scenarios: {passed} passed, {failed} failed");return failed==0?0:1;
 }
}
