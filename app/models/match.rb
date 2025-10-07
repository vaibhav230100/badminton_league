class Match < ApplicationRecord
  belongs_to :player_one, class_name: 'Player'
  belongs_to :player_two, class_name: 'Player'
  belongs_to :winner, class_name: 'Player'

  validate :players_cannot_be_same, :winner_should_be_between_the_two
  after_create :update_player_records

  private

  def players_cannot_be_same
    if player_one_id == player_two_id
      errors.add(:player_two_id, "can't be the same as Player One")
    end
  end

  def winner_should_be_between_the_two
    valid_ids = [player_one_id, player_two_id]
    unless valid_ids.include?(winner_id)
      errors.add(:winner_id, "must be either Player One or Player Two")
    end
  end  

  def update_player_records
    loser = (winner_id == player_one_id) ? player_two : player_one
    winner.increment!(:wins)
    loser.increment!(:losses)
  end
end
