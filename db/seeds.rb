# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

games = [
            {:title => 'Halo 3', :genre => 'Action', :score => 92, :developer => 'Bungie'},
    	    {:title => 'GTA 4', :genre => 'Open-World', :score => 85, :developer => 'Rockstar Games'},
    	    {:title => 'FIFA 20', :genre => 'Sports', :score => 54, :developer => 'EA'},
            {:title => 'World Of Warcraft' , :genre => 'MMO', :score => 82, :developer => 'Blizzard'},
            {:title => 'Age Of Empires 2' , :genre => 'Strategy', :score => 95, :developer => 'Ensemble Studios'},
            {:title => 'Minecraft' , :genre => 'Open-World', :score => 81, :developer => 'Mojang'},
            {:title => 'Red Dead Redemption' , :genre => 'Open-World', :score => 80, :developer => 'Rockstar Games'},
            {:title => 'Overwatch' , :genre => 'Action', :score => 80, :developer => 'Blizzard'},
  	    ]

games.each do |game|
  Game.create!(game)
end