class Game < ActiveRecord::Base
    validates :title, presence: true
    validates :score, presence: true

  def self.find_with_same_developer(developer)
    Game.where(:developer => developer) 
  end
end
