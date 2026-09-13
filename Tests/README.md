# Verification

Run from the standalone repository root:

```powershell
dotnet build Source/MoreStorylikeTraits.csproj -c Release -p:OutputPath="$PWD/.build/audit-bin/"
dotnet run --project Tests/WorkerTests.csproj -c Release
python Tests/test_xml.py
& ../scripts/Check-XmlFields.ps1 -ModPath "$PWD/Mod" -ExtraAssemblies "$PWD/Mod/Assemblies/MoreStorylikeTraits.dll"
& ../scripts/Check-DefRefs.ps1 -ModPath "$PWD/Mod" -GameData 'C:/Program Files (x86)/Steam/steamapps/common/RimWorld/Data/Core'
& ../scripts/Check-DefInjected.ps1 -TransMod "$PWD/Mod" -ExtraAssemblies "$PWD/Mod/Assemblies/MoreStorylikeTraits.dll"
```

Use an absolute OutputPath for an isolated comparison build (MSBuild otherwise resolves
relative output paths from Source). Compare its SHA256 to the shipped DLL. Tests and
intermediates stay outside Mod. The parent scripts are the shared local audit tools;
they require the installed game's assemblies/data and may need explicit paths elsewhere.
They complement the repository's portable regression suite.

WorkerTests links the two real production source files and exercises their branching
logic with minimal game-boundary doubles, in 20 scenarios. These tests do not initialize
RimWorld, reproduce its implementation of pawn acquaintance/capacities, or prove runtime
serialization/UI behavior. The real reference build separately establishes API compatibility.
The final in-game scenarios in TEST_SCENARIOS.md remain mandatory.

The eight XML/content tests check syntax, duplicate definitions, complete French coverage,
English fallbacks, nonempty text, parameter identity, tier colors, skillGains custom-loader
shape and absence of an unintended settings page. The shared DefInjected validator checks
paths independently against engine reflection and the game/mod data.

French descriptions intentionally use PAWN_nameDef and impersonal constructions in place
of English pronoun/possessive accessors. They still reference the same PAWN NamedArgument;
requiring an identical list of accessors would impose English grammar on French. No numeric
or other data parameter is removed. Runtime rendering still needs male/female pawn checks.

`inventory.py` exports a source-text inventory to .build for editorial work. Delivered
French XML files are the maintained translation source; temporary editorial TSV files
are not runtime inputs. `Art/Build-Preview.cjs` uses Node.js with playwright and sharp,
reads the palette JSON and generates the screenshot plus QA artifacts in .build/preview-qa.
It does not edit the source illustration. Use NODE_PATH if packages are provided by the
bundled runtime, and CHROME_PATH if Chrome is installed elsewhere.
