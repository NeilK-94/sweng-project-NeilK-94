Feature: search for games by developer
    As a gamer
    So I can find games with the same developer
    I want to include and search on developer information in games I enter

Background: games in database
 
  Given the following games exist:
  | title               | genre      | score | developer      |
  | Halo 3              | Action     | 92    |                |
  | Minecraft           | Open World | 81    | Mojang         |
  | GTA 4               | Open World | 85    | Rockstar Games |
  | Red Dead Redemption | Open World | 80    | Rockstar Games |

  And I am on the home page

Scenario: add developer to existing game
  When I go to the edit page for "Halo 3"
  And  I fill in "Developer" with "Bungie"
  And  I press "Update Game Info"
  Then I should see "Bungie"

Scenario: find game with same developer (happy path)
  Given I am on the details page for "GTA 4"
  When  I follow "Find Games With Same Developer"
  Then  I should be on the Similar Games page for "GTA 4"
  And   I should see "Red Dead Redemption"
  But   I should not see "Minecraft"

Scenario: can't find game with same developer if developer isn't known (sad path)
  Given I am on the details page for "Halo 3"
  Then  I should not see "Bungie"
  When  I follow "Find Games With Same Developer"
  Then  I should be on the home page
  And   I should see "'Halo 3' has no developer info"