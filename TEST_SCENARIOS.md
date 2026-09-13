# Final in-game validation scenarios

Status: **NOT RUN**. Never launch RimWorld automatically. The operator runs these scenarios
and records observed results, game/mod versions, save type, UI language and log excerpts.
`done` means ready to run this document; only successful execution permits `tested`.

## Preconditions shared by all scenarios

Use the canonical `MoreStorylikeTraitsRenew/Mod` directory, with the DLL, definitions,
languages and Preview hashes recorded in Tests/RESULTS.json. Start with Core and this mod
only, RimWorld 1.6. Do not load the original HYP mod or Body and Mind alongside it.
Use disposable test saves or copies of real saves. Enable development mode for controlled
pawn/trait setup. Capture Player.log after each session; mark unrelated errors separately.
Do not treat a changed label alone as proof that a stat or social effect worked.

Repeat scenarios 1–6 with English and French selected. Include male and female pawns.
Use the game's developer tools to give/remove the exact traits from the shipped XML.
The list below is generated from those definitions for unambiguous identification.

## 1. Clean load and metadata

**Preconditions:** Core + this mod, no DLC, no other trait mod; new disposable colony.
**Actions:** Open the mod list and start the colony. Inspect the name, icon and source link.
Open Mod options and the main button bar. Check the log after loading.
**Expected:** More Storylike Traits Renew (unofficial), version support 1.6, readable icon,
correct source repository. No empty mod settings page or visible/greyed settings shortcut.
No missing class, duplicate Def, XML, translation or assembly-load error from this mod.
All 53 TraitDefs and 31 ThoughtDefs load. No third-party dependency is requested.

## 2. Trait roster, descriptions and actual stats

**Preconditions:** Two ordinary humanlike adult test pawns, one male and one female, with
no genes/health effects affecting the stat being inspected. Record baseline skills/stats.
**Actions:** For each of the 53 traits in the roster, apply its declared degree to a fresh
pawn or reset the previous trait first. Open the bio/trait tooltip and relevant stat
explanations; compare skill gains, offsets, factors and work restrictions to its degreeData.
Where mutually exclusive traits are declared, try the conflicting pair using normal
creation/generation rules (debug bypasses are not evidence of a conflict failure).
**Expected:** Label and whole description resolve, including the pawn name. All rarity
colors match the English override; no raw keys, braces, garbled characters or unreadable
clipping. Stat explanations show the declared values, skill changes use the proper skills,
and forbidden work matches the definition. Conflicts apply under normal generation.
**Record:** Trait/degree, pawn, language, expected XML value, observed value, pass/fail.

## 3. Social thought worker

**Preconditions:** Two acquainted humanlike colonists in the same faction; inspect the
12 ThoughtDefs in Thoughts_Situation_Social.xml and their triggerTraits/flags.
**Actions:** For each social ThoughtDef, give the subject one listed trigger trait and
inspect the thinker's opinion breakdown after the game's normal thought refresh. Remove
it and refresh. Repeat with only the thinker carrying the trait, an unrelated subject
trait, an unacquainted subject, and a nonhuman subject. For sameFactionOnly definitions,
repeat with another faction. For validWithDisfigured false/true, apply disfigurement to
the subject on a disposable pawn and compare both cases.
**Expected:** The thought activates only for an acquainted humanlike subject with an
active listed trait, honoring the actual faction/disfigurement flags. Giving the trait
to the thinker alone does not activate it. Label and opinion offset match the ThoughtDef.
No null-reference exception or repeating log error occurs.

## 4. Weapon, schedule, body-part and memory thoughts

**Preconditions:** Pawns carrying each thought's required trait; read the corresponding
Thoughts_TakingWeaponStage, Thoughts_TraitsHYP and Thoughts_Memory_HYPMisc files.
**Actions:** Compare unarmed, ranged-weapon and melee-weapon states. Advance through day
and night for night-owl conditions. On disposable pawns, add the body-part counts named
by the thought stages and inspect each stage. Trigger the kill-memory situations in a
controlled encounter and inspect the memory text, mood offset and duration.
**Expected:** The ranged-weapon worker applies only its declared ranged condition; no
invented melee bonus is expected. Schedule/body-part stages use their declared boundaries
and offsets. Memories use the correct text, duration and mood effect. The declarations,
not prose assumptions, are the numeric oracle. Labels/descriptions render in both languages.

## 5. Save/reload and existing-save upgrade

**Preconditions:** Save A is the new test colony carrying representative R/SR/SSR/UR/W/N
traits and an active social thought; Save B is a COPY of an existing colony from the prior
version of this port (same packageId/defNames).
**Actions:** Save A, close the game normally, relaunch manually and reload. Load Save B
with this version, inspect pawn traits/opinions and save/reload a new copy. Also add this
mod to a copied colony that never used it and inspect existing pawns plus newly generated
pawns. Do not remove the mod from the user's original save.
**Expected:** Existing trait identities/degrees and valid memories survive. Recomputed
social thoughts still honor their conditions. No missing Def/class reference, corrupted
save, involuntary trait duplication or new mod exception. Adding the mod does not promise
retroactive random traits for existing pawns; newly generated pawns may draw its traits.

## 6. Language switching and layout

**Preconditions:** Representative male/female pawns with long trait descriptions, all six
rarity tiers and both positive/negative thoughts.
**Actions:** Switch English -> French -> English using the normal language workflow and
restart when requested. Inspect bio tooltips, opinion breakdowns and memory descriptions
at the operator's normal UI scale, then one larger scale.
**Expected:** Full intended text in the selected language, no English fallback in French,
no raw DefInjected keys or pawn tokens, matching colors and no truncated inaccessible text.
Document screen resolution/UI scale and screenshots of any defect.

## 7. Optional Biotech regression

**Preconditions:** Repeat with Core + Biotech + this mod, recording exact versions. Prepare
a subject with a trigger trait and a gene that suppresses it.
**Actions:** Confirm the gene suppression, inspect the social thought before/after it, then
remove suppression and refresh. Save/reload with suppression active.
**Expected:** Suppressed trigger traits do not activate the custom social thought; an
unsuppressed matching trait can. No requirement for Biotech in the Core-only session.
**Not applicable:** If Biotech is unavailable, record this scenario as unverified optional
integration, never as tested. No RIMMSQOL test applies because there is no settings shortcut.

## Evidence record

For every scenario, record date, game version, commit + payload hashes, language, new/existing
save, mod list, precondition deviations, expected/observed result and Player.log excerpts.
After any fix, repeat the affected scenario and its save/language regressions. Keep old
results as history; do not overwrite a failed run with an unqualified pass.

## Trait roster

| DefName | English label |
| --- | --- |
| HYPR01TakeScreenBrother | screen photographer |
| HYPR02TeacherRaosSecretDict | pixel perfect |
| HYPR03NaturesPorter | nature's porter |
| HYPR04MasterSection | grandmaster league |
| HYPR05EraHasChanged | era has changed? |
| HYPR06Constructor | certified builder |
| HYPR07KingOfTheKing | firecracker childhood |
| HYPR08DelicaciesBloggerDevotee | food blogger's disciple |
| HYPR09GrowVegetablesUnderTheBed | vegetables under the bed |
| HYPR10ChickenFarmer | chicken whisperer |
| HYPRMC11Player | cube-world architect |
| HYPR12LetoHobby | brick stacker |
| HYPR13HolyHanderOfTheCervicalSpine | cervical spine specialist |
| HYPR14StudyOne | a word with the press |
| HYPR15OfCourseUseful | of course it's useful |
| HYPSR01NeverCheat | never cheated |
| HYPSR02DescendantsOfTaiChi | tai chi inheritor |
| HYPSR03JustMoreWonders | just one more turn |
| HYPSR04TheHeadmasterOfBlueFly | excavator school principal |
| HYPSR05TheSecretOfNewOriental | the spirit cookbook |
| HYPSR06GoldKeLa | miracle fertiliser |
| HYPSR07LifelongMember | lifelong member |
| HYPSR08AVirtuousAndArtisticArtist | artist of impeccable virtue |
| HYPSR09CarIntoBeads | turn it into beads |
| HYPSR10TopOfTheFourScalpels | first of the four scalpels |
| HYPSR11UnspeakableHorror | unspeakable horror |
| HYPSR12ObviouslyAndClearly | obviously, trivially |
| HYPSR13SoManyIdea | absurdist |
| HYPSSR01ThePersonInDream | the person in dreams |
| HYPSSR02RuthlessWorkMachine | ruthless work machine |
| HYPSSR03PetrochemicalSkin | petrified skin |
| HYPSSR04StupidAsStupidDoes | fools have all the luck |
| HYPSSR05TheUltimateBricklayer | ultimate brick-hauler |
| HYPSSR06BloodthirstyViking | bloodthirsty viking |
| HYPSSR07FieldSniper | field sniper |
| HYPSSR08InfrastructureSpree | infrastructure maniac |
| HYPSSR09Excavator | geologist |
| HYPSSR10YuZuSoftFan | visual novel devotee |
| HYPSSR11TheSecretSeedsOfEAAS | academy seeds |
| HYPSSR12DolphinVoiceTalent | dolphin voice |
| HYPSSR13FirearmsExpert | firearms expert |
| HYPSSR14ArtZoneDivision | art master |
| HYPSSR15MasterOfNegotiations | master of negotiations |
| HYPUR01CrystallizedSkin | crystallized skin |
| HYPUR02CombinedLeekHarvester | leek harvester |
| HYPUR03TheDealWithLucifer | the deal with Lucifer |
| HYPUR04SuperArtificialIntelligence | superintelligence |
| HYPUR05FondOfFoldingStools | fond of folding stools |
| HYPW01Ignoramus | unlettered |
| HYPW02ExtremelyObese | extremely obese |
| HYPN01FinelyCrafted | good work takes time |
| HYPN02TheArrowInTheKnee | arrow in the knee |
| HYPN03OnTheSameHandAndFoot | same hand, same foot |
