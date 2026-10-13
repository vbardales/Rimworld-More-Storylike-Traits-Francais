<#
.SYNOPSIS
  Builds FRENCH_REVIEW.md from the shipped French DefInjected XML, for TRANSLATIONS.md's
  "Systematic French review by Virginie" (2026-09-30).
.DESCRIPTION
  This mod ships French text only. Each key is `defName.degreeDatas|stages.<handle>.label|description`,
  keyed on the normalized English label of the target mod's own Def (HYP's More Storylike Traits
  (Continued), 2941176778). The English and Original columns are that target Def's own text, resolved
  by the same handle rule the game uses (normalize the label, suffix `-<rank>` on duplicates).
  Original = English: the target's English is the base, no other source language is kept.
  Needs the target's `1.6` folder (steamcmd download), given with -Target.
#>
param(
    [string]$Root = (Split-Path $PSScriptRoot -Parent),
    [string]$Target = 'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\2941176778\1.6',
    [string]$OutFile = (Join-Path (Split-Path $PSScriptRoot -Parent) 'FRENCH_REVIEW.md')
)
$ErrorActionPreference = 'Stop'
function Normalize([string]$h){
  if([string]::IsNullOrEmpty($h)){return $h}
  $h=$h.Trim().Replace(' ','_').Replace("`n",'_').Replace("`r",'').Replace("`t",'_').Replace('.','').Replace('-','')
  $h=[regex]::Replace($h,'\{.*?\}','')
  $h=-join($h.ToCharArray()|Where-Object{'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890-_'.IndexOf($_) -ge 0})
  $h=[regex]::Replace($h,'_+','_').Trim('_')
  if($h -match '^[0-9]+$'){$h="_$h"}
  $h}
function Handles($labels){
  $n=@($labels|ForEach-Object{Normalize $_})
  $res=@();for($i=0;$i -lt $n.Count;$i++){
    $same=@($n|Where-Object{$_ -eq $n[$i]}).Count
    if($same -gt 1){$rank=@($n[0..$i]|Where-Object{$_ -eq $n[$i]}).Count-1;$res+="$($n[$i])-$rank"}else{$res+=$n[$i]}}
  $res}
# English text of the target, by key
$en=@{}
Get-ChildItem "$Target\Defs" -Recurse -Filter *.xml | ForEach-Object {
  [xml]$x = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
  foreach($d in $x.Defs.ChildNodes){
    if($d.NodeType -ne 'Element' -or -not $d.defName){continue}
    $dn=$d.defName
    if($d.LocalName -eq 'TraitDef'){
      $items=@($d.degreeDatas.li); $hs=@(Handles @($items|ForEach-Object{$_.label}))
      for($i=0;$i -lt $items.Count;$i++){ foreach($f in 'label','description'){ if($items[$i].$f){$en["$dn.degreeDatas.$($hs[$i]).$f"]=[string]$items[$i].$f} } }
    } elseif($d.LocalName -eq 'ThoughtDef'){
      $items=@($d.stages.li); $hs=@(Handles @($items|ForEach-Object{$_.label}))
      for($i=0;$i -lt $items.Count;$i++){ foreach($f in 'label','description'){ if($items[$i].$f){$en["$dn.stages.$($hs[$i]).$f"]=[string]$items[$i].$f} } }
    }
  }}
# Texts the session doubts, by key: one line saying why (TRANSLATIONS.md, review file).
$doubts = @{
  'HYPR05EraHasChanged.degreeDatas.Era_has_changed.description' = 'reworded 2026-09-30 to remove a masculine-only participle (Élevé): now "a grandi"'
  'HYPSR11UnspeakableHorror.degreeDatas.Unspeakable_horror.description' = 'reworded 2026-09-30 to remove a masculine-only noun (un fidèle)'
  'HYPSR08AVirtuousAndArtisticArtist.degreeDatas.A_virtuous_and_artistic_artist.description' = 'reworded 2026-09-30 to remove a masculine-only participle (aimé)'
  'HYPSSR05TheUltimateBricklayer.degreeDatas.The_ultimate_bricklayer.description' = 'reworded 2026-09-30 to remove a masculine-only noun (l''ultime porteur)'
  'HYPRThought05DreamPeople.stages.The_Person_In_Dream.label' = 'reworded 2026-09-30 to remove a masculine-only participle (croisé)'
  'HYPSR02DescendantsOfTaiChi.degreeDatas.Descendants_of_tai_chi.description' = 'tone: the rewrite goes well beyond the English'
}
$doubts['HYPR03NaturesPorter.degreeDatas.Natures_porter.description'] = 'reworked 2026-10-12: "le porteur de la nature" now carries the three-segment switch, article included (le porteur : la porteuse : lu portaire)'
$doubts['HYPSSR07FieldSniper.degreeDatas.Field_sniper.description'] = 'reworked 2026-10-12: "son propriétaire" now carries the three-segment switch; the neutral possessive is the al system''s su (son : sa : su)'
$doubts['HYPSKS17Happy.stages.killed_someone.description'] = 'reworked 2026-10-12: "abattu" says what happened (the pawn killed someone), "touché" did not'
$doubts['HYPMasterhappy.stages.Starcraft_II_Korean_master_has_ranged_weapon.description'] = 'reworked 2026-10-12: "gun sight" is "viseur", not a screen'
$doubts['HYPKnightUnhappy.stages.Knight_has_ranged_weapon.label'] = 'reworded 2026-10-12 to remove a masculine-only noun: a thought stage label has no gender field here (not verified in the game code), so the text is epicene'
$doubts['HYPRangeWeaponVikingUnhappy.stages.Has_ranged_weapon.label'] = 'reworded 2026-10-12 to remove a masculine-only noun, as for the knight'
$neutralLabels = @('HYPR03NaturesPorter.degreeDatas.Natures_porter.label','HYPSR02DescendantsOfTaiChi.degreeDatas.Descendants_of_tai_chi.label','HYPR06Constructor.degreeDatas.Constructor.label','HYPR12LetoHobby.degreeDatas.Leto_hobby.label','HYPSR10TopOfTheFourScalpels.degreeDatas.Top_of_the_Four_Scalpels.label','HYPSSR05TheUltimateBricklayer.degreeDatas.The_ultimate_bricklayer.label','HYPSSR07FieldSniper.degreeDatas.Field_sniper.label')
# Trait degree labels: the game picks by the pawn's gender (RimWorld.TraitDegreeData.GetLabelFor, decompiled 2026-10-12): Male -> labelMale, Female -> labelFemale, no gender -> label; an empty field falls back to label. The label text is NOT run through Formatted, so a switch cannot work there. So `label` holds the neutral (al system) form, `labelMale` the masculine, `labelFemale` the feminine.
# A trait label with no `labelFemale` is epicene by itself (disciple, viking sanguinaire, photographe, géologue...).
$frRoot = (Get-ChildItem (Join-Path $Root 'Mod/Languages') -Directory -Filter 'French*' | Select-Object -First 1).FullName
$cell = { param($s) if($null -eq $s){'*(not found - check by hand)*'} else {(($s -replace '\|','\|') -replace "`r?`n",' ')} }
$out = New-Object System.Text.StringBuilder
$modName = ([xml](Get-Content (Join-Path $Root 'Mod/About/About.xml') -Raw -Encoding UTF8)).ModMetaData.name
[void]$out.AppendLine("# French review - $modName")
[void]$out.AppendLine()
$lic = if((Get-Content (Join-Path $Root 'STATUS.md') -Raw -Encoding UTF8) -match '(?m)^licence:\s*(\S+)'){ $Matches[1] } else { '' }
$repoType = switch($lic){ 'original' {'original'} {$_ -in 'forbidden','alive'} {'forbidden'} default {'renew'} }
$dirty = @(git -C $Root status --short -- Mod/Languages).Count
$state = if($dirty){ "**the texts below are the working tree, which differs from that commit in $dirty file(s)**" } else { 'the texts below equal that commit' }
[void]$out.AppendLine("Repository type: $repoType (licence $lic).")
[void]$out.AppendLine()
[void]$out.AppendLine("Last commit touching Mod/Languages: $(git -C $Root log -1 --format=%h -- Mod/Languages); generated $(Get-Date -Format 'yyyy-MM-dd'); $state.")
[void]$out.AppendLine()
[void]$out.AppendLine('Generated by `scripts/Generate-FrenchReview.ps1` from the shipped XML, for TRANSLATIONS.md''s systematic French review.')
[void]$out.AppendLine('**Original column: same as English throughout.** This mod has no source in another language: the English is the target mod''s own text (HYP''s More Storylike Traits (Continued), Workshop 2941176778, `1.6` folder). The French is our own rewrite of the biographies, so it says a little more than the English.')
[void]$out.AppendLine()
foreach($ff in (Get-ChildItem $frRoot -Recurse -Filter *.xml | Sort-Object FullName)){
  $rel = $ff.FullName.Substring($frRoot.Length+1) -replace '\\','/'
  [xml]$x = Get-Content -LiteralPath $ff.FullName -Raw -Encoding UTF8
  $rows = @($x.LanguageData.ChildNodes | Where-Object NodeType -eq 'Element')
  if(-not $rows.Count){continue}
  [void]$out.AppendLine("## $rel"); [void]$out.AppendLine()
  [void]$out.AppendLine('| Key or path | Original | English | French | ? |'); [void]$out.AppendLine('|---|---|---|---|---|')
  foreach($n in $rows){
    $k=$n.LocalName; $fr=$n.InnerText; $e=$en[$k]
    $why = $null
    if($fr -match '\{PAWN_gender' -and $fr -notmatch '\{PAWN_gender \?[^:}]*:[^:}]*:[^}]*\}'){ $why = 'PAWN_gender switch that is not the three-segment form' }
    elseif($doubts.ContainsKey($k)){ $why = $doubts[$k] }
    elseif($k -like '*.labelFemale' -or $k -like '*.labelMale'){ $why = 'gendered form of the label: the game picks it for a male or female pawn (injection into an empty field not yet played)' }
    elseif($neutralLabels -contains $k){ $why = 'neutral form (al system) used for a pawn with no gender: -eur gives -aire as proposed by the review, -ier gives -iær and -é gives -æ by the -ier -> -iær model (officier -> officiær); validated 2026-10-13 in the al system (Alpheratz thesis, Wiktionnaire), constructed forms, not normative French' }
    $flag = if($why){ "? $why" } else { '' }
    if($null -eq $e -and $k -match '.label(Male|Female)$'){ $e = $en[($k -replace '.label(Male|Female)$','.label')] }
    [void]$out.AppendLine("| $k | $(& $cell $e) | $(& $cell $e) | $(& $cell $fr) | $flag |")
  }
  [void]$out.AppendLine()
}
[System.IO.File]::WriteAllText($OutFile,$out.ToString(),(New-Object System.Text.UTF8Encoding($false)))
"wrote $OutFile"
