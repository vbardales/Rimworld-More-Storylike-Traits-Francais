# TESTING.md, family "loading". Plays in every pass, English or French.
#
# This mod is XML only. The offline check (scripts/Check-DefInjected.ps1) proves every DefInjected
# key names a real field of Lin's Defs. What only a running game shows is that the real loader
# accepts the files, that the mod loads after the mod it translates, and that a save carrying
# these traits and thoughts loads without an error from them.
Feature: the translation loads after the mod it translates, and a game runs with it

  Scenario: the mods are active and load in the documented order
    Then mod "SevenColorType.Hyperionc" is loaded
    And mod "nelim.morestoryliketraits.fr" is loaded
    And mod "nelim.morestoryliketraits.fr" loads after "SevenColorType.Hyperionc"

  Scenario: the defs the translation aims at exist
    Then def "HYPR01TakeScreenBrother" of type "TraitDef" exists
    And def "HYPSKS17Happy" of type "ThoughtDef" exists

  Scenario: loading a game with the mod raises no error and no warning of its own
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warnings from mod "nelim.morestoryliketraits.fr"
