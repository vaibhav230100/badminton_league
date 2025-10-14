class PlayersController < ApplicationController
  before_action :find_player, only: [ :destroy ]

  def index
    @players = Player.order(wins: :desc)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path, notice: "Player was successfully added."
    else
      render :new
    end
  end

  def destroy
    @player.destroy
    redirect_to players_path, notice: "Player was removed."
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end

  def find_player
    @player = Player.find(params[:id])
  end
end
