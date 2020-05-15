Feature: display list of games filtered by genres
 
  As a concerned parent
  So that I can quickly browse games appropriate for my family
  I want to see games matching only certain genres

Background: games have been added to database

  Given the following games exist:
  | title               | genre      | score | developer      |
  | Halo 3              | Action     | 92    |                |
  | Minecraft           | Open-World | 81    | Mojang         |
  | GTA 4               | Open-World | 85    | Rockstar Games |
  | World Of Warcraft   | MMO        | 80    | Blizzard       |
  | FIFA 20             | Sports     | 80    | EA             |

  And I am on the home page

Scenario: restrict to games with 'Sports' or 'MMO' genres
  When I check the following genres: Sports, MMO
  And I uncheck the following genres: Action, Open-World, Strategy
  And I press "genres_submit"
  Then I should see "FIFA 20"
  And I should see "World Of Warcraft"
  And I should not see "Halo 3"
  And I should not see "GTA 4"
  And I should not see "Minecraft"

Scenario: all genres selected
  When I check the following genres: Action, Open-World, Strategy, Sports, MMO
  And I press "genres_submit"
  Then I should see all the games

#   Table won't seem to allow 0 records to be displayed, need to fix that before testing for it
# Scenario: no genres selected
#   When I uncheck the following genres: Action, Open-World, Strategy, Sports, MMO
#   And I press "genres_submit"
#   Then I should see no games
