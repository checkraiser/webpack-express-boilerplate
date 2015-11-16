Feature: Crud Todo
  @javascript
  Scenario:
    Given I login successfully
    When I fill in the textbox 'Hello World'
    Then I could see 'Hello World'

