# More Storylike Traits - Français (unofficial)

UNOFFICIAL. This translation is published without the original author's explicit consent.
If the original author contacts me to request its removal, I undertake to take it down promptly.

French text for all 53 traits and 31 thoughts of
[HYP's More Storylike Traits (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2941176778)
(packageId `SevenColorType.Hyperionc`, declared 1.1 to 1.6). Text only: no code, no Defs, no patches.

This repository used to hold a full 1.6 port of the original mod (*More Storylike Traits Renew*),
abandoned on 2026-09-29 because Lin's Continued mod already covers it. That port is kept on the
`for-lin` branch, with its code fixes, English rewrite and tests, so Lin can take what is useful.

## Layout

```
Mod/                                         <- distributed folder
  About/About.xml
  Languages/French (Français)/DefInjected/   <- 166 keys: TraitDef (3 files), ThoughtDef (4 files)
Art/                                         <- never published: preview source, overlay, palette
docs/                                        <- protocols read, run history
```

## Notes for anyone editing this

- **Keys follow the target's labels.** A DefInjected key is built from the normalised English label
  of the target mod's Def (`Take Screen Brother`), not from the earlier rewrite this text was
  translated from (`screen photographer`). Keys copied from the port silently miss.
- English is left to the target's own Defs; only French is injected. Rarity colour tags stay inside
  the French labels, as the target does per language.
- Validate with `scripts/Check-DefInjected.ps1 -TransMod Mod -Targets <Lin's 1.6 folder>
  -ExtraAssemblies <its DLL>`: 166 keys, 0 errors (2026-09-29).
- The French rewrites the meaning of the rewritten English of the port, not the original English.
- Not checked in game.
