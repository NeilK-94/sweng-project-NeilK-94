class Game < ActiveRecord::Base
  
  def self.find_with_same_developer(developer)
    Game.where(:developer => developer) 
  end
end
