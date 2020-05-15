Feature: display list of games filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse games appropriate for my family
  I want to see games matching only certain MPAA ratings

Background: games have been added to database

  Given the following games exist:
  | title               | genre      | score | developer      |
  | Halo 3              | Action     | 92    |                |
  | Minecraft           | Open World | 81    | Mojang         |
  | GTA 4               | Open World | 85    | Rockstar Games |
  | Red Dead Redemption | Open World | 80    | Rockstar Games |

  And I am on the home page

Scenario: restrict to games with 'Action' or 'Open World' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  # enter step(s) to uncheck all other checkboxes
  # enter step to "submit" the search form on the homepage
  # enter step(s) to ensure that PG and R games are visible
  # enter step(s) to ensure that other games are not visible
  When I check the following ratings: PG, R
  And I uncheck the following ratings: G, PG-13
  And I press "ratings_submit"
  Then I should see "The Incredibles"
  And I should see "The Terminator"
  And I should not see "Alladin"
  And I should not see "The Help"

Scenario: all ratings selected
  When I check the following ratings: PG, R, G, PG-13
  And I press "ratings_submit"
  Then I should see all the games
