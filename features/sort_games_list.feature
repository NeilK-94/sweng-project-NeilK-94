Feature: display list of games sorted by title or score
 
  As a gamer
  So I can sort games based on their title or score
  I want to see movies sorted by title or score

Background: games in database
 
  Given the following games exist:
  | title               | genre      | score | developer      |
  | Halo 3              | Action     | 92    |                |
  | Minecraft           | Open World | 81    | Mojang         |
  | GTA 4               | Open World | 85    | Rockstar Games |
  | Red Dead Redemption | Open World | 80    | Rockstar Games |

  And I am on the home page

Scenario: sort games alphabetically by title
  When I follow "Game Title"
  Then I should see "GTA 4" before "Halo 3"

Scenario: sort games in descending order of score
  When I follow "Score"
  Then I should see "Halo 3" before "Red Dead Redemption"
