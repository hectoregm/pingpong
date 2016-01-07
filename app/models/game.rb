class Game < ActiveRecord::Base
  validates :played_at, presence: true
  validates :winner, presence: true

  belongs_to :winner, class_name: User
end
