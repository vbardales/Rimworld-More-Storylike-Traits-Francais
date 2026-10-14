using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using RimWorks.Pickle;
using RimWorld;
using Verse;

namespace MoreStorylikeTraitsFR.PickleSteps
{
    /// <summary>
    /// What Pickle's own steps cannot say about the French of More Storylike Traits: give a colonist a
    /// trait and read back the label and the description the game shows for THAT pawn (a label with a
    /// male, a female and a neutral form follows the pawn's gender, a description holds gender switches).
    ///
    /// Every step text starts with "More Storylike Traits FR:". Pickle loads the steps of every active
    /// suite into one namespace, and two suites declaring the same text make healthy scenarios fail with
    /// "Ambiguous step". No text uses parentheses or slashes, which Cucumber expressions read as
    /// optional text and alternatives.
    ///
    /// NOTHING HERE REFERENCES THE MOD'S ASSEMBLY: the translation has none. Traits are found by defName.
    /// </summary>
    [PickleSteps]
    public class MoreStorylikeTraitsSteps
    {
        private static readonly Regex ColorTags = new Regex("</?color[^>]*>", RegexOptions.IgnoreCase);

        private static Pawn PawnNamed(PickleContext ctx, string name)
        {
            IReadOnlyList<Pawn> spawned = Find.CurrentMap.mapPawns.AllPawnsSpawned;
            Pawn found = spawned.FirstOrDefault(p =>
                (p.Name is NameTriple triple && triple.Nick == name) || p.LabelShort == name);
            ctx.Assert(found != null, $"no pawn named {name} on the map; pawns: "
                + string.Join(", ", spawned.Where(p => p.RaceProps.Humanlike).Select(p => p.LabelShort)));
            return found;
        }

        private static TraitDef TraitDefNamed(PickleContext ctx, string defName)
        {
            TraitDef def = DefDatabase<TraitDef>.GetNamedSilentFail(defName);
            ctx.Assert(def != null, $"no TraitDef {defName}");
            return def;
        }

        private static Trait TraitOf(PickleContext ctx, string defName, string name)
        {
            Pawn pawn = PawnNamed(ctx, name);
            Trait trait = pawn.story.traits.GetTrait(TraitDefNamed(ctx, defName));
            ctx.Assert(trait != null, $"{name} has no trait {defName}; traits: "
                + string.Join(", ", pawn.story.traits.allTraits.Select(t => t.def.defName)));
            return trait;
        }

        [Given("More Storylike Traits FR: {string} is given only the trait {string}")]
        public void GivenOnlyTrait(PickleContext ctx, string name, string defName)
        {
            Pawn pawn = PawnNamed(ctx, name);
            TraitDef def = TraitDefNamed(ctx, defName);
            foreach (Trait existing in pawn.story.traits.allTraits.ToList())
            {
                pawn.story.traits.RemoveTrait(existing, false);
            }
            pawn.story.traits.GainTrait(new Trait(def, 0, true));
        }

        /// <summary>The label the game draws for this pawn, colour tags removed.</summary>
        [Then("More Storylike Traits FR: the trait {string} of {string} is labelled {string}")]
        public void Labelled(PickleContext ctx, string defName, string name, string expected)
        {
            Trait trait = TraitOf(ctx, defName, name);
            string label = ColorTags.Replace(trait.LabelCap.ToString(), string.Empty);
            string wanted = ColorTags.Replace(expected, string.Empty);
            ctx.Assert(string.Equals(label, wanted, System.StringComparison.OrdinalIgnoreCase),
                $"the trait {defName} of {name} (gender {PawnNamed(ctx, name).gender}) reads \"{label}\", expected \"{wanted}\"");
        }

        [Then("More Storylike Traits FR: the description of the trait {string} of {string} contains {string}")]
        public void DescriptionContains(PickleContext ctx, string defName, string name, string fragment)
        {
            Trait trait = TraitOf(ctx, defName, name);
            string text = trait.TipString(PawnNamed(ctx, name));
            ctx.Assert(text.Contains(fragment),
                $"the description of {defName} for {name} (gender {PawnNamed(ctx, name).gender}) does not contain \"{fragment}\": {text}");
        }

        /// <summary>No gender switch or pronoun token left unresolved in the text the player reads.</summary>
        [Then("More Storylike Traits FR: the description of the trait {string} of {string} has no unresolved token")]
        public void NoRawToken(PickleContext ctx, string defName, string name)
        {
            Trait trait = TraitOf(ctx, defName, name);
            string text = trait.TipString(PawnNamed(ctx, name));
            ctx.Assert(!Regex.IsMatch(text, "[{}]|PAWN_"), $"the description of {defName} for {name} keeps a raw token: {text}");
        }
    }
}
