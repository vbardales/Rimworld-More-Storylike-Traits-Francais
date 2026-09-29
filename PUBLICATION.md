# Publication

What the Workshop page needs that nothing else in this repository carries. See `PUBLISHING.md` at the monorepo
root for the workflow, "Publier par la CI" included. Drafted 2026-09-29, before any upload: nothing here is posted.

## Screenshots for the Workshop page

None taken yet. Steam's gallery is a manual upload (SteamCMD sends the header image only), so the images live in
`Art/Gallery/` once they exist, outside `Mod/`. Planned order, most demonstrative first:

1. A pawn's bio tab in French with a trait: French label in its rarity colour, the description with the pawn's
   name in place. It needs a pawn carrying one of the 53 traits, so it is a Pickle capture scenario still to write
   (custom setup step, not a built-in step).
2. The trait tooltip of the same pawn.
3. A thought in the mood tab, in French.

Every image is opened and looked at before upload: a green capture scenario does not prove the image shows
anything. No dev tool, no launcher panel, developer-mode gibberish counts as a defect.

## Thank-you messages

Register: `WORKSHOP_COMMENTS.md` at the monorepo root. To post only once the item is public.

- **Lin (liweilin111), HYP's More Storylike Traits (Continued), 2941176778:** the owner posted the proposal
  (French text and fixes) on 2026-09-29. Wait for the reply; no second comment.
- **Hyperion-c and DarthCY, original mod 2012787971:** to draft, one personalised comment. Credit the author of the
  original and the maintainer of the Continued mod, checked on the pages. The owner decides whether to write it.
- **Pickle, RimLogging:** development only, never a dependency. Already thanked in their own register rows; add
  this mod to `Covers`.

## Dependencies and DLC

- Hard: `SevenColorType.Hyperionc` (Lin's Continued mod), in `modDependencies` and `loadAfter`. A translation
  does nothing without it, and the code of a translation references nothing, so this is the only true dependency.
- No DLC, no Harmony, no other mod. `supportedVersions`: 1.6. No `LoadFolders.xml`.
- The original mod (2012787971) has the same package id and also works, but stops at 1.3.

## Adult-content checkboxes

Text only, no images shipped beyond the icon and the preview, both opened. One description mentions bloodthirst
(`Bloodthirsty_Viking`); no sexual content, no drugs, no nudity. Answer: none of the adult categories. The owner
answers the boxes.

## Steam release notes (0.1.0)

Created by the first upload, private until the owner makes it public.
"First release. French names and descriptions for the 53 traits and 31 thoughts of HYP's More Storylike Traits
(Continued). Requires that mod, loaded before this one."

## After the upload

Commit `Mod/About/PublishedFileId.txt` at once (lost, the next upload creates a second item). Steam creates the
item private; RimWorld never sets its visibility.
