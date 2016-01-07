class Game < ActiveRecord::Base
  validates :played_at, presence: true
  validates :winner, presence: true
  validates :loser, presence: true
  validates :winner_score, presence: true
  validates :loser_score, presence: true

  validates_numericality_of :winner_score, only_integer: true, less_than_or_equal_to: 21,
                            greater_than_or_equal_to: 0

  validates_numericality_of :loser_score, only_integer: true, less_than_or_equal_to: 21,
                            greater_than_or_equal_to: 0

  validate :legit_win
  
  belongs_to :winner, class_name: User
  belongs_to :loser, class_name: User

  private

  def legit_win
    if winner_score - loser_score <= 1
      errors.add(:winner_score, "a difference of two points is needed for a win")
    end
  end
end
