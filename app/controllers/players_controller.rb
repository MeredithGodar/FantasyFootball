class PlayersController < ApplicationController
	before_filter :set_current_user
  def show
    id = params[:id] # retrieve player ID from URI route
    @player = Player.find(id) # look up player by unique ID
    puts(@player)
    # will render app/views/players/show.<extension> by default
  end

  def index
    @players = Player.all
  end

  def new
    # default: render 'new' template
  end

  def dontcreate
    @player = Player.create!(params[:player])
    flash[:notice] = "#{@player.name} was successfully added."
    redirect_to players_path
  end

  def edit
    @player = Player.find params[:id]
  end

  def update
    @player = Player.find params[:id]
    @player.update_attributes!(params[:player])
    flash[:notice] = "#{@player.name} was successfully updated."
    redirect_to player_path(@player)
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:notice] = "Player '#{@player.name}' deleted."
    redirect_to players_path
  end
  
  def create
    players_file = IO.read("json/players.json")
    players = JSON.parse(players_file)
    flag = false
    players.each do |x|
      if(x[1]["full_name"].eql?(params[:player][:name]) and (Player.find_by_name(params[:player][:name]) == nil))
        player = {:name => x[1]["full_name"], :position => x[1]["position"], :team => x[1]["team"], :college => x[1]["college"], :birthdate => x[1]["birthdate"], :height => x[1]["height"], :weight => x[1]["weight"], :number => x[1]["number"]}
        puts(x)
        @player = Player.create!(player)
        #@player.team = x[1]["team"]
        #@player.position = x[1]["position"]
        flash[:notice] = "#{@player.name} was successfully added."
        flag = true
      end
    end
    if(flag == false)
      flash[:notice] = "#{params[:player][:name]} was not found or is already added."
    end
    redirect_to players_path
  end

end
