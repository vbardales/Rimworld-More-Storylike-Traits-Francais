# Changelog

All notable changes to this mod are recorded here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project uses
[semantic versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

First stable version (1.0.0). The 0.1.0 upload below only created the private Workshop item; this is the first version meant for players.

### Added

- French text for the 53 traits and 31 thoughts of HYP's More Storylike Traits (Continued), for RimWorld 1.6. Text only: no code, no Defs. It needs that mod and loads after it.
- Feminine and neutral forms for seven trait labels, picked by the pawn's gender (`labelMale`, `labelFemale`, and `label` for a pawn with no gender, in the al system): porteur de la nature, héritier du tai-chi, bâtisseur qualifié, empileur de briques, premier des quatre scalpels, ultime porteur de briques, tireur embusqué.
- Three-segment gender switches (masculine, feminine, neutral) in the descriptions of Nature's Porter ("le porteur de la nature") and Field Sniper ("son propriétaire").

### Changed

- Two thought labels that named a masculine type (a knight, a viking holding a firearm) are now epicene.
- The thought about having killed someone now says "J'ai abattu ma cible", and the Starcraft master's thought says "Pas besoin de viseur" (a gun sight, not a screen).
- The French text of five descriptions and one label was reworded so that it no longer agrees in the masculine only (Era has changed, Unspeakable horror, A virtuous and artistic artist, The ultimate bricklayer, The person in dream).

## [0.1.0] - 2026-10-01

Creation of the publishIdFile: the first upload exists only to create the (private) Workshop item and
obtain `About/PublishedFileId.txt`. It is not a tested version and the item is not public. The upload
contained `Mod/` as it stood at commit `195b1a3`.

### Added

- French text for 53 traits and 31 thoughts, keyed on the labels of HYP's More Storylike Traits (Continued).

### Removed

- The 1.6 port of the original mod (assembly, Defs, English and Chinese text, tests). Abandoned
  because Lin's Continued mod already covers it; kept on the `for-lin` branch.
