class Matches::DecrementPlayerRecordsService
  attr_reader :match

  def initialize(match)
    @match = match
  end

  def call
    ActiveRecord::Base.transaction do
      decrement_player_records
      match.destroy!
    end
    ServiceResult.new(success: true, message: "Match and player records updated successfully.")
  rescue => e
    ServiceResult.new(success: false, message: "Failed to update player records: #{e.message}")
  end

  private

  def decrement_player_records
    winner = match.winner
    loser = (match.winner_id == match.player_one_id) ? match.player_two : match.player_one

    winner.decrement!(:wins)
    loser.decrement!(:losses)
  end
end
