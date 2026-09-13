// Minimal boundary doubles. These exercise the actual linked production worker's decisions,
// not RimWorld initialization, serialization or rendering. Those require the game scenarios.
namespace Verse {
 public class DefModExtension {}
 public class PawnCapacityDef {}
 public class RaceProperties { public bool Humanlike = true; }
 public class CapacityTracker { public readonly HashSet<PawnCapacityDef> Missing = new(); public bool CapableOf(PawnCapacityDef d) => !Missing.Contains(d); }
 public class Health { public CapacityTracker capacities = new(); }
 public class Story { public RimWorld.TraitSet traits = new(); }
 public class Pawn { public RaceProperties RaceProps = new(); public object Faction; public Health health = new(); public Story story = new(); public bool Known = true; public bool Disfigured; }
 public static class ListExtensions { public static bool NullOrEmpty<T>(this List<T> v) => v == null || v.Count == 0; }
}
namespace RimWorld {
 public class TraitDef {}
 public class Trait { public TraitDef def; public bool Suppressed; }
 public class TraitSet { public List<Trait> allTraits = new(); }
 public class ThoughtDef { public Verse.DefModExtension Extension; public T GetModExtension<T>() where T:Verse.DefModExtension => Extension as T; }
 public readonly struct ThoughtState { public readonly bool Active; private ThoughtState(bool active) {Active=active;} public static implicit operator ThoughtState(bool b)=>new(b); }
 public abstract class ThoughtWorker { public ThoughtDef def; protected abstract ThoughtState CurrentSocialStateInternal(Verse.Pawn pawn, Verse.Pawn other); }
 public static class RelationsUtility { public static bool PawnsKnowEachOther(Verse.Pawn a, Verse.Pawn b)=>a.Known && b.Known; public static bool IsDisfigured(Verse.Pawn p)=>p.Disfigured; }
}
