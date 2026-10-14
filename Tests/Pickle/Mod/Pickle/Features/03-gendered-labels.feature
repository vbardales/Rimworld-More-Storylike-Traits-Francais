# TESTING.md and TEST_SCENARIOS.md, S3 and S4. Only meaningful in a French game: run it with `-Language French`.
# The seven traits of Lin's mod whose French label has a male, a female and a neutral (al system) form, and the
# two descriptions that hold a gender switch. A colonist is given ONLY that trait, so the label read is the one
# the game computes for that pawn (`Trait.LabelCap`, colour tags removed). Neutral = `Gender.None`, the pawn with no
# gender: `GetLabelFor` falls back on `label`. The neutral scenario depends on the ColonistRace step
# `gender is neutral`, written 2026-10-08 and not played in a game yet: a red there may be the step, not the text.
@requires:nelim.pickletools.colonistrace
Feature: the French labels follow the pawn's gender

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused

  Scenario Outline: <trait> reads <male> on a man, <female> on a woman, <neutral> on a pawn with no gender
    Given a colonist "Ada" exists
    And Nelim's Pickle Tools: "Ada" gender is male
    And More Storylike Traits FR: "Ada" is given only the trait "<trait>"
    Then More Storylike Traits FR: the trait "<trait>" of "Ada" is labelled "<male>"
    Given Nelim's Pickle Tools: "Ada" gender is female
    Then More Storylike Traits FR: the trait "<trait>" of "Ada" is labelled "<female>"
    Given Nelim's Pickle Tools: "Ada" gender is neutral
    Then More Storylike Traits FR: the trait "<trait>" of "Ada" is labelled "<neutral>"
    And no errors were logged

    Examples:
      | trait                        | male                          | female                         | neutral                      |
      | HYPR03NaturesPorter          | porteur de la nature          | porteuse de la nature          | portaire de la nature        |
      | HYPSR02DescendantsOfTaiChi   | héritier du tai-chi           | héritière du tai-chi           | héritiær du tai-chi          |
      | HYPR06Constructor            | bâtisseur qualifié            | bâtisseuse qualifiée           | bâtissaire qualifiæ          |
      | HYPR12LetoHobby              | empileur de briques           | empileuse de briques           | empilaire de briques         |
      | HYPSR10TopOfTheFourScalpels  | premier des quatre scalpels   | première des quatre scalpels   | premiær des quatre scalpels  |
      | HYPSSR05TheUltimateBricklayer| ultime porteur de briques     | ultime porteuse de briques     | ultime portaire de briques   |
      | HYPSSR07FieldSniper          | tireur embusqué               | tireuse embusquée              | tiraire embusquæ             |

  Scenario Outline: the gender switch of <trait> resolves for each gender, with no raw token left
    Given a colonist "Ada" exists
    And Nelim's Pickle Tools: "Ada" gender is male
    And More Storylike Traits FR: "Ada" is given only the trait "<trait>"
    Then More Storylike Traits FR: the description of the trait "<trait>" of "Ada" contains "<male>"
    And More Storylike Traits FR: the description of the trait "<trait>" of "Ada" has no unresolved token
    Given Nelim's Pickle Tools: "Ada" gender is female
    Then More Storylike Traits FR: the description of the trait "<trait>" of "Ada" contains "<female>"
    And More Storylike Traits FR: the description of the trait "<trait>" of "Ada" has no unresolved token
    Given Nelim's Pickle Tools: "Ada" gender is neutral
    Then More Storylike Traits FR: the description of the trait "<trait>" of "Ada" contains "<neutral>"
    And More Storylike Traits FR: the description of the trait "<trait>" of "Ada" has no unresolved token

    Examples:
      | trait               | male               | female              | neutral          |
      | HYPR03NaturesPorter | le porteur         | la porteuse         | lu portaire      |
      | HYPSSR07FieldSniper | son propriétaire   | sa propriétaire     | su propriétaire  |
