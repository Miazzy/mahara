@javascript @core @blocktype @blocktype_wall
Feature: The wall block should send out notifications
    In order to make it easier for the wall owner to know about new wall posts
    So they can respond to those new wall posts

Background:
    Given the following "users" exist:
     | username | password | email | firstname | lastname | institution | authname | role |
     | userA | Kupuhipa1 | test01@example.org | Pete | Mc | mahara | internal | member |
     | userB | Kupuhipa1 | test02@example.org | Son | Nguyen | mahara | internal | member |

Scenario: Wall post notifications
The wall post must generate a notification (Bug 547333)
    Given I log in as "userB" with password "Kupuhipa1"
    And I choose "Find people" in "Groups" from main menu
    And I follow "Pete Mc"
    And I scroll to the base of id "wall-wrap"
    And I set the field "Post" to "Hello"
    And I press "Post"
    And I log out
    And I log in as "userA" with password "Kupuhipa1"
    And I choose "mail" from user menu by id
    Then I should see "New post on your wall"
    When I click on "New post on your wall"
    Then I should see "Hello"
    And I should see "View whole wall"
    When I follow "View whole wall"
    Then I should see "Pete Mc: Wall"
    And I should see "Son Nguyen"
    And I should see "Hello"