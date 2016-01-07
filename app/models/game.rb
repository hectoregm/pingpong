class Game < ActiveRecord::Base
  validates :played_at, presence: true
end
