class Game < ActiveRecord::Base
  validates :played_at, presence: true
  validates :winner, presence: true
  validates :loser, presence: true
  validates :winner_score, presence: true
  validates :loser_score, presence: true

  belongs_to :winner, class_name: User
  belongs_to :loser, class_name: User
end
