class Game < ActiveRecord::Base
  attr_accessor :opponent, :your_score, :their_score

  validates :played_at, presence: true
  validates :winner, presence: true
  validates :loser, presence: true

  validates_numericality_of :winner_score, only_integer: true, less_than_or_equal_to: 21,
                            greater_than_or_equal_to: 0

  validates_numericality_of :loser_score, only_integer: true, less_than_or_equal_to: 21,
                            greater_than_or_equal_to: 0

  validate :legit_win
  
  belongs_to :winner, class_name: User
  belongs_to :loser, class_name: User

  def opponent=(opponent_id)
    self.loser_id = opponent_id
  end

  def your_score=(score)
    self.winner_score = score
  end

  def their_score=(score)
    self.loser_score = score
  end

  before_validation :set_winner_and_loser

  private

  def legit_win
    if winner_score && loser_score && winner_score - loser_score <= 1
      errors.add(:winner_score, "a difference of two points is needed for a win")
    end
  end

  def set_winner_and_loser
    return unless winner_score && loser_score
    candidate_winner = winner
    candidate_loser = loser
    candidate_winner_score = winner_score
    candidate_loser_score = loser_score

    unless candidate_winner_score >= candidate_loser_score
      self.winner = candidate_loser
      self.loser = candidate_winner
      self.winner_score = candidate_loser_score
      self.loser_score = candidate_winner_score
    end
  end
end
