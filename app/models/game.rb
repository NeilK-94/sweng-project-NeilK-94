class Game < ActiveRecord::Base
    validates :title, presence: true, length: { in: 3..35 }
    validates :score, presence: true, :numericality => { :greater_than => 0, :less_than => 100 }

  def self.find_with_same_developer(developer)
    Game.where(:developer => developer) 
  end
end
