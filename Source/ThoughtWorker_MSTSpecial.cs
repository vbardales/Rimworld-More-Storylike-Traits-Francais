using System.Collections.Generic;
using RimWorld;
using Verse;

namespace MoreStorylikeTraits
{
    /// <summary>
    /// A social thought about someone else's traits: "that one is a combat expert", "that one is
    /// an unspeakable horror". The trait list and the conditions live in an
    /// <see cref="MSTModExtension"/> on the ThoughtDef, so one worker serves all twelve.
    ///
    /// <para><paramref name="pawn"/> is the one doing the thinking; <c>other</c> is the one being
    /// thought about, and it is <c>other</c> who must carry the trait.</para>
    /// </summary>
    public class ThoughtWorker_MSTSpecial : ThoughtWorker
    {
        protected override ThoughtState CurrentSocialStateInternal(Pawn pawn, Pawn other)
        {
            MSTModExtension ext = def.GetModExtension<MSTModExtension>();
            if (ext == null)
            {
                return false;
            }

            // A def with no trait list can only ever be a mistake in the XML, but an empty list is
            // a legitimate way to switch a thought off. The 1.3 assembly guarded neither and threw
            // a NullReferenceException on the first one; nothing in this mod's defs hit it, which
            // is exactly why it survived three RimWorld versions unnoticed.
            if (ext.triggerTraits.NullOrEmpty())
            {
                return false;
            }

            if (!other.RaceProps.Humanlike || !RelationsUtility.PawnsKnowEachOther(pawn, other))
            {
                return false;
            }

            if (!ext.validWithDisfigured && RelationsUtility.IsDisfigured(other))
            {
                return false;
            }

            if (ext.sameFactionOnly && pawn.Faction != other.Faction)
            {
                return false;
            }

            if (ext.requireCapacityOfPawn != null
                && !pawn.health.capacities.CapableOf(ext.requireCapacityOfPawn))
            {
                return false;
            }

            // The 1.3 assembly read this one off `pawn` as well - a copy-paste from the line above,
            // which made the two fields mean the same thing. No def in the mod sets either, so the
            // bug never fired; it is fixed here so the field means what its name says.
            if (ext.requireCapacityOfOther != null
                && !other.health.capacities.CapableOf(ext.requireCapacityOfOther))
            {
                return false;
            }

            // Suppressed is Biotech-era and did not exist when this was written: a gene can switch
            // a trait off while leaving it in the list. Someone whose ferocity is currently
            // suppressed should not read as a combat expert, so skip those.
            List<Trait> traits = other.story.traits.allTraits;
            for (int i = 0; i < traits.Count; i++)
            {
                if (!traits[i].Suppressed && ext.triggerTraits.Contains(traits[i].def))
                {
                    return true;
                }
            }

            return false;
        }
    }
}
