Feature: Pick an emoji for a todo
  As a user
  I want to pick an emoji from a fixed list for my todo
  So that todos are labeled consistently

  Scenario: User picks an allowed emoji for a new todo
    Given I am on the new todo page
    When I fill in "Description" with "Buy milk"
    And I pick the "🛒" emoji from the allowed list
    And I click "Create Todo"
    Then I should see "Todo was successfully created"
    And I should see "🛒" on the page

  Scenario: User cannot use a custom emoji
    Given I am on the new todo page
    When I fill in "Description" with "Custom emoji task"
    And I try to enter "🎸" as the emoji
    And I click "Create Todo"
    Then I should see "must be selected from the allowed options"
    And the todo should not be saved
