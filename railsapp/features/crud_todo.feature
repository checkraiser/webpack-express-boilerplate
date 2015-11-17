Feature: Crud Todo
  @javascript
  Scenario: Create new todo
    Given I login successfully
    When I fill in the textbox 'Hello World'
    And I click 'Add' button
    Then I could see 'Hello World'

