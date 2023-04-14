Feature: Send automated email to banned users
    As a user 
    So that I can know I have been banned
    I want to be receive automated email.

Scenario: Test for Ban User
    Given I am on the user page
    When I press "edit"
    Then I should see "Ban User"
    When I press "Ban User"
    Then I should redirect to "ban_comment"
    When I fill in "Comment" with "You have been banned"
    And I press "Save"
    Then I should be redirected to the user page

Scenario: Test for unBan User
    Given I am on the user page
    When I press "edit"
    Then I should see "unBan User"
    When I press "unBan User"
    Then I should be redirected to the user page

    