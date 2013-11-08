class PlayersController < ApplicationController
#before_filter :set_current_user
  def show
    id = params[:id] # retrieve player ID from URI route
    @player = Player.find(id) # look up player by unique ID
    # will render app/views/players/show.<extension> by default
  end

  def index
    @players = Player.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @player = Player.create!(params[:player])
    flash[:notice] = "#{@player.name} was successfully created."
    redirect_to players_path
  end

  def edit
    @player = Player.find params[:id]
  end

  def update
    @player = Player.find params[:id]
    @player.update_attributes!(params[:player])
    flash[:notice] = "#{@player.name} was successfully updated."
    redirect_to movie_path(@player)
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:notice] = "Player '#{@player.name}' deleted."
    redirect_to players_path
  end

end
