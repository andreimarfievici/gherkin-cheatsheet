#this is were we begin, with the Feature name and description
#keep it simple and say what it is using plain language
# As a <role>
# I want a <functionality>
# So that <benefit>

Feature: Countries of the world encyclopedia
  As a passionate quizzer
  I want to use a countries of the world encyclopedia
  So that I can get useful information about specific countries

  Background: Gather Information #these steps will execute before each scenario
    Given I have read many books
    And I have gathered information about countries of the world

  #use none or as many tags you feel it's necessary
  @smoke @chrome_only @AT-123
  Scenario: Add country
    #Scenario: <scenario name> - meaningful name
    #Given <precondition> - always true, must be met before running the test
    #When <action> - it's what we actually test
    #Then <outcome>
    Given the name is "Italy" #always use double quotes for variables
    And the capital is "Rome" #use as many Ands as you wish
    When I add this country to the encyclopedia
    Then all the country information should be added #always use "should" for asserting outcome

    #this is not "illegal" and if it makes sense, just use it this way linking GWT GWT GWT in the same scenario
    But the name is "Romania" #you can use But too
    And the capital is "Bucharest"
    When I add this country to the encyclopedia
    Then all the country information should be added
    #it is still part of the same scenario above so you will be testing adding 2 countries
    #you'll probably want to use a Scenario Outline like below

  Scenario Outline: Add multiple countries using outline examples
    Given the name is "<name>"
    And the capital is "<capital>"
    When I add this country to the encyclopedia
    Then all the country information should be added
    #you actually have a scenario that will run 4 times with different data so 4 scenarios in one
    Examples:
    | name        | capital      |
    | China       | Beijing      |
    | Japan       | Tokyo        |
    | New Zealand | Wellington   |
    | Argentina   | Buenos Aires |

  Scenario: Add country using tabular data:
    Given I have the following country information:
    #when you have too many variable data use tables like this
    | name     | capital   | continent | population |
    | Scotland | Edinburgh | Europe    | 5.2        |
    When I add this country to the encyclopedia
    Then all the country information should be added

    Scenario Outline: Add country using tabular data and outline examples:
      Given I have the following country information:
      | name   | capital   | continent   | population   |
      | <name> | <capital> | <continent> | <population> |
      When I add this country to the encyclopedia
      Then all the country information should be added

      Examples:
      | name    | capital    | continent     | population |
      | Israel  | Jerusalem  | Asia          | 8.5        |
      | Egypt   | Cairo      | Africa        | 95.6       |
      | Uruguay | Montevideo | South America | 3.4        |

  Scenario: Add country using in-line paragraphs
    Given the name is "Uganda"
    And the description is:
    #use this for very long variable data
    """
    Uganda is a landlocked country in East Africa.
    It has a diverse landscape encompassing the snow-capped Rwenzori Mountains and immense Lake Victoria.
    Its abundant wildlife includes chimpanzees as well as rare birds.
    Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary.
    Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.
    """
    When I add this country to the encyclopedia
    Then all the country information should be added
