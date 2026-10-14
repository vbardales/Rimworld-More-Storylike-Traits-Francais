# Test scenarios

One scenario per behaviour promised in `PUBLICATION.md` and in the `About.xml` description. Written 2026-10-13
(`writeTests[1.0.0]`, AUDIT.md 7.a). Figures checked against `Mod/Languages/French (Français)/DefInjected`: 180 keys
(166 plus 7 `labelMale` and 7 `labelFemale`), 53 traits, 31 thoughts. Not played yet: they run at `playTests`.

Setup of every scenario: Core + Lin's mod (2941176778) + this mod, in this order; Pickle companion mod only for S1.
Language French unless stated.

| Id | Promise | Preconditions | Actions | Expected result | Run by |
| --- | --- | --- | --- | --- | --- |
| S1 | Mod loads after Lin's mod; no error from this mod | Order Core, Lin, this mod | Start a game, load a save | No error or warning from this mod in `Player.log` | Pickle (`Tests/Pickle`, features 01 and 02, French and English) |
| S2 | French labels and descriptions for the 53 traits | A pawn carrying a trait of Lin's mod | Open the bio tab, then the trait tooltip | French label in its rarity colour; full French description; the pawn's name in place of the token | Pickle feature 04 (`@review` capture of the bio tab, to open) plus owner read |
| S3 | Gendered labels follow the pawn (7 traits with `labelMale` / `labelFemale`) | One male and one female pawn with the same such trait | Read the label on each | Masculine form on the male, feminine form on the female; neutral form (`label`) only on a pawn with no gender | Pickle feature 03 (all three forms) |
| S4 | Pronouns follow the pawn's gender (switch in descriptions, e.g. `NaturesPorter`, `FieldSniper`) | A male and a female pawn with each trait | Read the description | Segment of the pawn's gender; no raw `{...}` visible | Pickle feature 03 |
| S5 | French for the 31 thoughts | A pawn with a thought from this mod | Open the mood tab | French thought label and text | Owner (manual) |
| S6 | English left to the original text | Language English | Same as S2 and S5 | English text of Lin's mod, unchanged by this mod | Pickle (English pass) plus owner read |
| S7 | Text only: no code, no Defs | None | `Check-DefInjected` against Lin's `1.6` folder and DLL | 180 keys, 0 errors | Script, rerun each audit (7.c) |

Not applicable, with the reason: see `TESTING.md`, "Not applicable". No settings (`settings_audit: not_applicable`),
no optional mod (no `@requires`), no `@wip`.
