---
localization: complete
translation_en: complete
translation_fr: complete
mod:          More Storylike Traits Renew (unofficial)
packageId:    nelim.morestoryliketraits
repo:         Rimworld-More-Storylike-Traits-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   refreshed on 2026-09-13; see ATTRIBUTION.md
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: removal of the empty legacy directory shell; Windows process lock
  - unverified: final in-game scenarios, logs, English/French UI and save regressions
session:      maj:        2026-09-12, releve automatique
updated:      2026-09-13, ready for final in-game validation
settings_audit: not_applicable
---

# More Storylike Traits Renew (unofficial) — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it.

The fields above were read off the disk on 2026-09-12. Four cannot be, and wait for whoever
holds this mod:

- **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from the session group where one exists; confirm it.
- **`tested_on`** — the date of the last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line already there is true of nearly the whole repository; replace it once it stops being.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

## Direct audit — 2026-09-13

### Scope and revision

Audited monorepo revision `75c3000e1833d325cc7626a402981e4aa881d47a`, with the
existing local STATUS.md addition of three unchecked localization fields preserved and
updated by this audit. No other local changes in this mod were reported at audit start.
The older sweep text and historical claims above are retained as history, not evidence
of current validation. `stage: dansMonoRepo` uses the literal user workflow state; the
old list of stage codes above does not govern this audit. Previous stage was empty.

Actual Git root: `C:/Users/nelim/Documents/rimworld`; actual distributed folder:
`C:/Users/nelim/Documents/rimworld/MoreStorylikeTraits/Mod`. No local `.git` exists for
this mod, and no matching standalone folder was found in `Documents/RimWorldMods`.
This does not establish that no other clone exists elsewhere. The absence of a
monorepo remote for this mod is not itself a defect or a reason for this state.

Read the parent PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and TRANSLATIONS.md.
The user's overriding rule permits source-based settings verification without launching
the game. RimWorld was not launched. No implementation, distributed artifact, image,
licence or publication was changed. No new tests were invented to complete development.

### Ordered transitions

| Transition | Result and evidence |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | **Defect:** current checkout is not autonomous. **Unverified:** GitHub repository, visibility and first push; `gh repo view vbardales/Rimworld-More-Storylike-Traits-Renew --json nameWithOwner,visibility,url,defaultBranchRef` could not read the protected GitHub CLI config. This does not prove a missing repository. STATUS, English README, ATTRIBUTION and CHANGELOG exist. Root and distributed attribution SHA256 match. Package ID is versionless and consistent with the content; differing folder/repository names are not inherently defects. |
| horsMonoRepo -> ModIcon generated | **Validated independently:** PNG icon inspected directly, 128 x 128, 13,026 bytes, readable mascot. **Unverified:** successful current build, shipped DLL correspondence and development completion. See build result below. |
| ModIcon generated -> Preview generated | **Validated independently:** actual Preview inspected, PNG 896 x 504, 486,530 bytes, below 1 MB. Room camera presents no concrete defect. Generation history and a historical screenshot comparison are not required. |
| Preview generated -> preOptions | **Defects:** About/README/STATUS title lacks `(unofficial)` under the retained public/silent decision; required opening UNOFFICIAL disclaimer absent; About description is English but lacks the mandatory final `[url=URL]Source code on GitHub[/url]`. Preview lacks version badge and status tag. Existing amber rule is visible, but there is no colored secondary status treatment to establish the required secondary/accent distinction. No linking words in this title need reduction. HTML exists in Art/preview.html; palette JSON is absent. The old dark veil alone is not a defect requiring regeneration. |
| preOptions -> options | **Not applicable justified**, passing independently: settings inventory below. |
| options -> l10n | **Defect:** French folder and coverage absent. **Validated independently:** native English text coverage and existing injection paths; see translation audit. |
| l10n -> preTest | **Validated independently at source/XML level:** code uses RimWorld and Verse only, no Harmony/framework dependency; About declares 1.6 and loadAfter Core. No LoadFolders, patches, conditional dependencies or optional settings integrations. Source authors/inspirations are credits, not dependencies. Reference checker resolves 84 definitions. Runtime load without DLC remains part of final testing. |
| preTest -> done | **Defects:** no functional scenario document with preconditions/actions/expected results and no automated behavior test suite found. **Validated independently:** XML tests executed successfully below. A build does not substitute for tests of the custom worker (capacity subject, faction, disfigurement, null/empty triggers and suppressed traits). Results for those behaviors remain unverified; not declared non-applicable. |
| done -> tested | **Unverified:** no executed game scenarios or logs tied to the delivered revision, no EN/FR UI validation, no new-game/existing-save regressions. The empty tested_on is preserved; it is not proof the game has never been run historically. Settings persistence and RIMMSQOL shortcut checks are not applicable to this settings-free mod. |

### Rights and naming

`visibility: public` and `licence: silent` retain the documented intended decision,
not a freshly verified GitHub visibility or upstream permission. ATTRIBUTION records
four checks dated 2026-09-05 and upstream support only through 1.3, with no permission
or refusal found then. This is internally consistent with the workflow's operational
silent classification; current upstream support/permission/refusal was not refreshed.
No licence file exists, and no third-party licence was invented or demanded merely to
fill that gap. The adoption paragraph must not be interpreted as permission from the
original authors. Required public/silent disclaimer and suffix are demonstrably absent.

### Settings audit

`settings_audit: not_applicable`. Read both C# files and inventoried the 53 TraitDefs
and 31 ThoughtDefs. The only custom types are a DefModExtension containing thought
conditions and a ThoughtWorker evaluating them. This is a faithful fixed-content port;
commonalities and balance values are deliberately part of that content, with a separate
Body and Mind variant documented for a different balance. No concrete player setting,
XML-only user configuration, persisted option or inherited settings UI was identified.
No Verse.Mod subclass, ModSettings, SettingsCategory, DoSettingsWindowContents,
MainButtonDef or settings shortcut exists. No empty page is exposed by these sources.
No settings defaults, input boundaries, persistence or shortcut integration tests apply.
No RIMMSQOL or other integration was tested. This passes the user's source-based gate;
it does not claim any interactive test.

### Translation audit

`localization: complete`, `translation_en: complete`, `translation_fr: complete`.
All mod-owned display text is in native TraitDef degree labels/descriptions and
ThoughtDef stage labels/descriptions. The two C# classes emit no UI strings.
There are 166 nonempty source label/description fields across the seven Def XML files.
English tier-color injections are present and nonempty; English Def text provides native
fallback without requiring duplicate English thought files. Source tokens are
`{PAWN_nameDef}`, `{PAWN_objective}`, `{PAWN_possessive}`, `{PAWN_pronoun}`.
Existing English and Chinese injected paths pass the supplied validator (382 keys).
No French resources exist, so FR coverage and parameter parity cannot pass. The zero
injection errors are not a claim of complete French coverage. About metadata and technical
comments are outside in-game localization. EN/FR rendering remains unverified in game.

### Executed checks and limitations

Commands ran from this mod folder on 2026-09-13, using the installed game assemblies
for reflection, without launching the game:

- PowerShell XML parsing of all 25 distributed XML files: zero malformed files.
- `../scripts/Check-XmlFields.ps1 -ModPath <Mod> -ExtraAssemblies <Mod/Assemblies/MoreStorylikeTraits.dll>`:
  exit 0, eight files checked, no unknown 1.6 fields. Passing the mod DLL resolves its
  custom extension fields; the historical README's 36-field limitation no longer applies.
- `../scripts/Check-DefRefs.ps1 -ModPath <Mod>`: exit 0, 84 definitions,
  no missing references, wrong reference types or unresolved parents. This checker indexes
  installed DLC as well as Core; its green result alone does not prove DLC independence.
- `../scripts/Check-DefInjected.ps1 -TransMod <Mod> -ExtraAssemblies <mod DLL>`:
  exit 0, 11,670 definitions indexed, 382 keys checked, zero errors.
- `dotnet build Source/MoreStorylikeTraits.csproj -c Release --no-restore
  -p:BaseIntermediateOutputPath=<mod>/.audit-build/obj/ -p:OutputPath=<mod>/.audit-build/bin/`:
  exit 1, MSB4184 before compilation, access denied to
  `C:/Users/nelim/AppData/Local/Microsoft SDKs`. This is an environment limitation,
  not a demonstrated source compile defect. No successful current build is certified.
- Shipped DLL: 5,120 bytes, SHA256
  `C6E80F34CDC4FCCDD14C5D5382E3B0D894BDB7229E7DDC7918EAB28F31C40384`.
  Its identity is recorded; its equivalence to a fresh build remains unverified.
- Root/distributed ATTRIBUTION SHA256:
  `872F0D04987970BC08908918FF35AD8A6163DCAAFE318B66A50B62DFE39C8A25`.
- Preview and icon were opened with the image inspection tool. No separate thumbnail
  render, pixel contrast measurement or current font-resolution check was performed;
  these are not being presented as observed failures. Existing source artwork is preserved.

### Strict next transition and optional recommendations

To reach horsMonoRepo: establish the standalone checkout and its configured GitHub
remote, verify repository visibility and a pushed first commit, refresh the rights
classification evidence, and make the required public/silent notices consistent with
the confirmed decision. Preserve applicable English documentation and attribution copies.
Do not invent a licence for the upstream material. These actions were not performed by
this audit. Later-stage FR, overlay, build and behavior-test work is recorded independently
and does not need to be completed merely to reach horsMonoRepo.

Optional: update stale validator notes in README and keep build references reproducible
when development resumes. These recommendations do not change the retained global stage.

## Progress — horsMonoRepo, 2026-09-13

This entry supersedes the current-state findings of the direct audit above; the audit
is retained unchanged as historical evidence. Stage uses the literal workflow name.

Canonical repository: `C:/Users/nelim/Documents/RimWorldMods/MoreStorylikeTraits`.
Distributed directory: `C:/Users/nelim/Documents/RimWorldMods/MoreStorylikeTraits/Mod`.
GitHub origin: `https://github.com/vbardales/Rimworld-More-Storylike-Traits-Renew.git`.
The repository was cloned from its existing main branch; its first pushed commit is
`4e9151f0596e51ea9ccefa6129a243caea6d7d4d` (2026-09-11). GitHub CLI verified PUBLIC
visibility, repository identity and that commit. Existing remote files matched local
content after line-ending normalization; the prior local STATUS audit was preserved.

The standalone checkout now carries the current local files. Transfer used an explicit
allowlist excluding .git and reparse points; copied file hashes were verified. No history
was rewritten. Public/silent remains the documented decision after rereading the original
Workshop page and installed About.xml: only 1.1–1.3 declared, no full-port licence found.
The title, README and About now carry the required unofficial notice, and the description
ends in the required source-code link to the verified repository. Attribution copies match.
No third-party licence was created. English documentation and historical results remain.

Build intermediates now resolve to this standalone repository's .build directory, outside
Mod/. The build command in README now starts at the standalone root. No game logic or
Def text changed, so independent settings/translation checks from the audit remain valid.
Only metadata, documentation and build-output routing changed.

The legacy directory `C:/Users/nelim/Documents/rimworld/MoreStorylikeTraits` remains on disk:
Windows denied moving the directory because a process holds it open. No backup or junction
was created by that failed operation, and no monorepo index entries were removed. This
legacy copy is not the canonical repository. Its STATUS is kept in sync for the current
task, but future development belongs in the standalone checkout. The existing game Mods
junction still targets the legacy path; game registration must be redirected before final
in-game validation. The game has not been started. Cleaning up the legacy copy is migration
housekeeping, not absence of an autonomous repository or of a first pushed commit.

The next stage remains ModIcon generated: verify a successful build and the shipped DLL
against these sources and establish development completion. The existing icon independently
passed direct inspection. Later FR, overlay and test-suite work remains listed above.

The prepared metadata/documentation changes have not been pushed: automatic approval
review requires explicit authorization before updating public main. The existing first
pushed commit still satisfies horsMonoRepo; current changes remain local pending that
authorization. Metadata XML, attribution equality and whitespace checks passed. The
standalone build-output path resolves inside the standalone repository, outside Mod/.

## Requested rename — 2026-09-13

Current display name: **More Storylike Traits Renew (unofficial)**. The user requested
replacing the title's 1.6 with Renew and renaming the folder and repository accordingly.
The standalone folder was renamed to
`C:/Users/nelim/Documents/RimWorldMods/MoreStorylikeTraitsRenew`; distributed content is
its `Mod/` child. Earlier paths in the audit/progress entries are historical.
The verified GitHub name is already `Rimworld-More-Storylike-Traits-Renew`, so no remote
rename is necessary; origin and both About links already use that repository.

The packageId `nelim.morestoryliketraits`, namespaces, assembly name and defNames remain
stable. Supported RimWorld version remains 1.6; only the display-name version was removed.
About, README and both attribution copies now use Renew. The legacy workspace metadata
is synchronized for the current task. The existing Preview still needs its planned
composition update, including the new Renew suffix, unofficial tag and version badge.
No image or game content was regenerated. Stage remains horsMonoRepo; independent
settings and text-resource checks are unaffected by this metadata-only change.
Public push remains pending explicit authorization as recorded above.

The game registration is now the verified junction
`C:/Program Files (x86)/Steam/steamapps/common/RimWorld/Mods/MoreStorylikeTraitsRenew`
pointing at the canonical `MoreStorylikeTraitsRenew/Mod` directory. The old junction
was removed without following or deleting its target. This supersedes the previous
pending-registration note. RimWorld was not launched. XML identity, supported version,
matching attribution copies and git diff --check passed after renaming.

## Workspace location correction — 2026-09-13

At the user's explicit request, the entire standalone checkout, including .git and
all local commits, was moved into `C:/Users/nelim/Documents/rimworld/MoreStorylikeTraitsRenew`.
This is the current canonical folder; earlier RimWorldMods paths are historical.
Its own Git root was verified at the new location and HEAD was preserved:
`86f92e19c27d3753fa89cbac20fddb032a030dd1`. The game Mods/MoreStorylikeTraitsRenew
junction now points to this folder's Mod child. No game was launched or files published.
The repository remains autonomous despite being physically under the rimworld parent.
Stage remains horsMonoRepo in the sense of Git independence, per the user's location choice.

All files in the old rimworld/MoreStorylikeTraits copy matched the standalone content
(after newline normalization) before the move. The old copy is still intact: automatic
approval review rejected its archival combined with forced removal from the shared
monorepo index. No such index change, archival or deletion occurred. Cleanup remains
pending explicit approval. The former RimWorldMods checkout path no longer exists.

## Authorized legacy cleanup — 2026-09-13

The user explicitly approved removal of the old copy and its monorepo index entries.
Before deletion, every old file was checked against the canonical repository: content
matched after newline normalization, and the old STATUS was preserved as a prefix of
the newer history. The targeted `git rm -r --cached -f -- MoreStorylikeTraits` completed;
zero old paths remain indexed. These removals are staged in the monorepo, not committed.
No other paths were passed to an index mutation; no shared-index commit was performed.

All old files and subdirectories were deleted. Windows still holds the empty directory
`C:/Users/nelim/Documents/rimworld/MoreStorylikeTraits` open, so removal of that final
empty shell failed. Its verified remaining entry count is zero. This is the only cleanup
remainder and does not affect the standalone mod or the game junction. Delete the empty
shell after the process holding it releases the directory; no further content migration
is needed. The user's cleanup approval does not authorize the separately pending push.

## Gate passed — ModIcon generated, 2026-09-13

At revision 17b368a, `dotnet build Source/MoreStorylikeTraits.csproj -c Release
-p:OutputPath=<repository>/.build/audit-bin/` passed with zero warnings and errors.
The output and distributed DLL have identical SHA256
C6E80F34CDC4FCCDD14C5D5382E3B0D894BDB7229E7DDC7918EAB28F31C40384.
The fixed-content implementation is complete; outstanding work is presentation,
localization and validation. The existing 128 x 128 PNG ModIcon passed direct inspection.


## Gate passed — Preview generated, 2026-09-13

The existing directly inspected Preview is a valid 896 x 504 PNG, 486,530 bytes.
Source art is preserved in Art/Preview-source.png. Overlay corrections follow separately.

## Gate passed — preOptions, 2026-09-13

Recomposed the existing HTML overlay without altering the original illustration.
Art/preview-palette.json is the sole color source, used by Art/Build-Preview.cjs and
Art/preview.html. Warm wood informs the veil and secondary ink; the worker's red coat
informs the distinct red accent. Segoe UI availability and document.fonts.ready checked.
Title is 46px/600; Renew is 65% in secondary ink. The unofficial tag and 1.6 badge match
About metadata. All text uses the prescribed hierarchy; no linking word needs reduction.
Full-size and 268px previews were directly inspected: title, suffix and badge identifiable,
no clipping or concrete camera defect. The PNG is 407,113 bytes at 896 x 504.
Minimum contrast over entire text bounding boxes: title 9.53, Renew 7.56, tag 6.61,
summary 9.78; badge 4.92. Reproducible results: .build/preview-qa/results.json.
The English description ends with the required verified GitHub source link and starts
with the unofficial notice. This completes the preOptions presentation gate.


## Gate passed — options, 2026-09-13

Reconfirmed the existing no-settings inventory against unchanged source and definitions.
No Verse.Mod/ModSettings UI, player configuration or MainButtonDef is present. Fixed trait
balance is part of this faithful port, not a missing configurable feature. Therefore
settings_audit remains not_applicable under the user's source-based gate; no UI or
RIMMSQOL interaction is claimed. Localization can now proceed.

## Gate passed — l10n, 2026-09-13

Installed and reviewed 166 French label/description fields in seven DefInjected files,
covering all 53 traits and 31 thoughts. All 50 colored English trait labels retain their
color markup in French. No game-code display strings exist. English remains supplied by
native Def text plus its tier-color overrides. French uses the same PAWN NamedArgument
via nameDef and impersonal sentences instead of copying English possessive syntax.
Tests/test_xml.py verifies argument identity, allowed accessors, braces, all keys,
nonempty text and color-tag parity. All eight content tests passed. The independent
engine-based Check-DefInjected.ps1 checked 548 keys with zero errors; no unresolved
targets were reported. localization, translation_en and translation_fr are complete
for preTest readiness only. Male/female descriptions and both UI languages still need
in-game review; no runtime language result is claimed.

## Gate passed — preTest, 2026-09-13

Reran Check-DefRefs.ps1 with GameData restricted to Data/Core, excluding all DLC data:
84 mod definitions, no unresolved references, wrong reference types or missing parents.
Check-XmlFields.ps1 with the distributed custom assembly passed (eight files, no unknown
1.6 fields). Source uses only RimWorld/Verse and its own extension/worker; About correctly
declares 1.6 and Core load order, with no required third-party mods. No LoadFolders or
conditional patches exist. Optional Biotech suppression behavior uses the core API and
does not introduce a DLC requirement. Settings and localization gates have passed.

## Gate passed — done, 2026-09-13

The complete ordered workflow now reaches **done**, meaning ready for final in-game
validation, not already tested in game. Base revision: 17b368a with this local change set.
Tests/RESULTS.json records executed checks and SHA256 identities of the actual distributed
payload, production sources, tests and Art inputs. Text hashes normalize BOM/CRLF for
portable comparison; binary hashes use exact bytes. It also records actual Chrome font
resolution (Segoe UI Semibold for the title) and measured Preview contrast.

- Reference build: passed, zero warnings/errors, exact match to the shipped DLL.
- Production worker logic: 20/20 scenarios passed against explicit game-boundary doubles.
  Missing extensions/lists, acquaintance, race, faction, disfigurement, correct capacity
  subject, active/suppressed traits and later matches are exercised. No actual game
  integration is implied by the doubles.
- XML/content regression suite: 8/8 passed; every one of 166 French fields covered,
  parameters valid, all 50 colored labels preserved, no unknown/empty French entry.
- Shared engine reflection/data checks: fields clean, Core-only references clean,
  548 translation paths clean. The mod's own DLL was passed where applicable.
- TEST_SCENARIOS.md now supplies prerequisites, actions and expected outcomes for loading,
  every trait, social thoughts, weapon/schedule/body-part/memory effects, new/existing
  saves, EN/FR and UI scales, with an optional Biotech suppression regression.

No settings/persistence or RIMMSQOL tests are applicable because the justified settings-free
implementation remains unchanged. Non-settings game behavior and save persistence remain
mandatory manual tests. No new gameplay feature or balancing change was introduced.
No RimWorld process was started, no runtime scenario was executed, and no log/UI pass is
claimed. Next transition: execute TEST_SCENARIOS.md in game and record results before tested.
Public push remains separately pending explicit authorization. The old empty locked
folder and staged monorepo removals do not affect this payload or its independent Git root.
