using System.Collections.Generic;
using RimWorld;
using Verse;

namespace MoreStorylikeTraits
{
    /// <summary>
    /// The conditions under which <see cref="ThoughtWorker_MSTSpecial"/> fires, attached to a
    /// ThoughtDef in XML as &lt;li Class="MoreStorylikeTraits.MSTModExtension"&gt;.
    ///
    /// Field names are the ones the original 1.3 assembly used. They are part of the XML surface
    /// of every ThoughtDef in this mod, so renaming any of them would silently drop the value:
    /// RimWorld logs an unknown element and carries on with the field unset.
    /// </summary>
    public class MSTModExtension : DefModExtension
    {
        /// <summary>Only think this of someone in the same faction.</summary>
        public bool sameFactionOnly;

        /// <summary>Still think this of someone whose face has been ruined.</summary>
        public bool validWithDisfigured;

        /// <summary>Capacity the thinker must still have (sight, hearing, ...).</summary>
        public PawnCapacityDef requireCapacityOfPawn;

        /// <summary>Capacity the subject must still have.</summary>
        public PawnCapacityDef requireCapacityOfOther;

        /// <summary>Any one of these traits on the subject sets the thought off.</summary>
        public List<TraitDef> triggerTraits;
    }
}
