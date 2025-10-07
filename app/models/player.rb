class Player < ApplicationRecord
  has_many :home_matches, class_name: 'Match', foreign_key: 'player_one_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'player_two_id'
  has_many :victories, class_name: 'Match', foreign_key: 'winner_id'

  validates :name, presence: true, uniqueness: true

  def total_games
    wins + losses
  end
end
