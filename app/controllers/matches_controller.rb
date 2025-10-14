class MatchesController < ApplicationController
  before_action :find_match, only: [ :destroy ]
  def index
    @matches = Match.includes(:player_one, :player_two, :winner).order(created_at: :desc)
  end

  def new
    @match = Match.new
    @all_players = Player.all
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to matches_path, notice: "Match result recorded."
    else
      @all_players = Player.all
      render :new
    end
  end

  def destroy
    @match.destroy
    redirect_to match_path, notice: "Match was removed."
  end

  private

  def find_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:player_one_id, :player_two_id, :winner_id)
  end
end
