# In-game scenarios, run by Pickle

Written 2026-09-29; features 03 and 04 and `Source/` added 2026-10-14. Features 03 and 04 are **not played**. Running them and reading the result belongs to `done -> tested`.

`Mod/` is a companion mod, *More Storylike Traits - Français - Pickle tests*, never published. Two features,
only built-in Pickle steps, no assembly.

## Scope

Kept in Gherkin: what only a running game shows. The real loader accepts the files, load order after Lin's mod,
and a save loads with no error and no warning from this mod. Everything provable offline is offline:
`scripts/Check-DefInjected.ps1` (166 keys resolve to real fields, 0 errors).

Deliberately left out:
- **Wording and rendering** (label, description, pronoun tokens, colour tags, bio tab, tooltips): the generic
  steps cannot read `degreeDatas` or `stages` by index, and a step assembly would only assert text the XML
  already holds. Read by a person, listed in `TESTING.md`, "In game".
- **Language switch, dependency warning, load order calculation**: the engine's job, not the mod's.
- **Settings, shortcut, restart**: the mod has none.

## Passes

| Pass | Command | Covers |
| --- | --- | --- |
| English | `-Mod MoreStorylikeTraitsFR` (features 01) | mod loads, save loads clean; the target's own English text |
| French | `-Language French` (features 01 and 02) | same, with the translation active |

No optional mod and no declared incompatibility, so no further pass. The map is `wsl-ids.map` only.

| French review | `-Language French -DepMap wsl-deps.french-review.map -Filter 03,04` | the label and description of the 7 gendered traits for a man, a woman and a pawn with no gender (03); the bio tab of a man and a woman, `@review` captures to open (04) |

The steps assembly is local because this is its only consumer: on a second mod, promote it to PickleTools (AGENTS.md, local scripts). To declare to NPT (the PickleTools session was not reachable on 2026-10-14). Build: `dotnet build -c Release` in `Source/`; the DLL is committed in `Mod/Pickle/Assemblies/`.
