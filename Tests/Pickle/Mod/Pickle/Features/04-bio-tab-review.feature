# TESTING.md and TEST_SCENARIOS.md, S2: what the player sees. A person opens the pictures (AUDIT.md 8.d): a green
# scenario only says the path ran. Not a test of the wording (03 is); it is the capture of the bio tab in French, a man
# and a woman with the same trait, the label in its rarity colour. Run with `-Language French`.
# The inspect pane is hidden by the game's screenshot mode, so no presentation mode is enabled here.
@review
@requires:nelim.pickletools.colonistrace
@requires:nelim.pickletools.inspecttabs
Feature: the bio tab shows the French trait

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused

  Scenario Outline: the bio tab of a <gender> pawn with "Nature's porter"
    Given a colonist "Ada" exists
    And Nelim's Pickle Tools: "Ada" gender is <gender>
    And More Storylike Traits FR: "Ada" is given only the trait "HYPR03NaturesPorter"
    When I select "Ada"
    And Nelim's Pickle Tools: I open the "ITab_Pawn_Character" inspect tab
    Then Nelim's Pickle Tools: the "ITab_Pawn_Character" inspect tab is open
    When I take a screenshot "bio-tab-fr-<gender>"
    Then no errors were logged

    Examples:
      | gender |
      | male   |
      | female |
