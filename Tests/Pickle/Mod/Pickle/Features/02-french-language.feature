# TESTING.md, family "French". Only meaningful in a French game: run it with `-Language French`.
# The language is chosen when the game starts, so this is a second pass, never a switch mid-run.
#
# In developer mode, which every Pickle run is, a missing French key shows as accented gibberish,
# not as English. A DefInjected path that resolves to nothing is logged by the loader, so the
# assertion carrying this feature is the empty error log after a colony with these traits loads.
# Reading a trait's label or description back by field is not possible with Pickle's generic
# steps (degreeDatas and stages are lists, and a numeric index in a dotted path is refused), so
# the wording itself is judged by eye: see TESTING.md, "In game".
Feature: a French game loads the translation without a missing key or an error

  Scenario: a French colony with the mod loads clean
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warnings from mod "nelim.morestoryliketraits.fr"
