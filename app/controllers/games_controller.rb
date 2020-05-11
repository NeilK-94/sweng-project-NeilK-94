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

  def search_developers
    @game = Game.find(params[:id])
    # Find developer of current game
    @current_game_developer = @game.developer
    if @current_game_developer.nil? or @current_game_developer.empty?
      # If current game has no developer, flash warning and redirect to games index page
      flash[:warning] = "'#{@game.title}' has no developer info."
      redirect_to games_path
    else
      # Else find all games with the current game developer
      @games_to_display = Game.find_with_same_developer(@current_game_developer)
    end
  end
end
