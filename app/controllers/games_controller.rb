class GamesController < ApplicationController
  def index
    #   Just display all the games
    @games = Game.all
  end

  def new
  end
end
