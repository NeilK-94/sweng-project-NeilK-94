class GamesController < ApplicationController
  
  def game_params
    params.require(:game).permit(:title, :genre, :score, :developer)
  end

  def index
    #   Just display all the games
    #   Will add to this for ordering etc.
    @games = Game.all
  end

  def show
    id = params[:id] # retrieve game ID from URI route
    @game = Game.find(id) # look up game by unique ID
    # will render app/views/games/show.html.haml by default
  end

  def new
    @game = Game.create!(game_params)
    flash[:notice] = "#{@game.title} was successfully created."
    redirect_to games_path
  end
end
