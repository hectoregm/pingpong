class Game < ActiveRecord::Base
  validates :played, presence: true
end
