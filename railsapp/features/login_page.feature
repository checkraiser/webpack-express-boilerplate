Feature: Login Page
  @javascript
  Scenario: Viewing Login Page
    Given There is already a user
    And A todo item
    And I'm not signed in
    When I visit home page
    Then I fill in login information
    Then I should see 'Todo item 1'

