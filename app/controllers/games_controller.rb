class GamesController < ApplicationController
  
  def game_params
    #   Removed .require to get it to work initially.
    #   Now game data isn't persisted to table after created
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

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:notice] = "'#{@game.title}' has been deleted."
    redirect_to games_path
  end

  # The edit action handles rendering the edit form
  # The update action will be the method that updates the database record itself. Just like 'new' and 'create'
  def edit
    @game = Game.find params[:id]
  end

  def update
    @game = Game.find params[:id]
    @game.update_attributes!(game_params)
    flash[:notice] = "#{@game.title} was successfully updated."
    redirect_to game_path(@game)
  end

  def new
    # default: render 'new' template
  end

  def create
    @game = Game.create!(game_params)
    flash[:notice] = "'#{@game.title}' was successfully added."
    redirect_to games_path
  end
end
