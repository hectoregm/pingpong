require 'rails_helper'

RSpec.describe Game, type: :model do

  before do
    @valid_attributes = { played_at: Time.now,
                          winner: User.create!(email: 'foo@regalii.com', password: 'secret123'),
                          loser: User.create!(email: 'bar@regalii.com', password: 'secret456'),
                          winner_score: 21,
                          loser_score: 19
                        }
  end

  it 'is sane' do
    expect(Game.new(@valid_attributes)).to be_valid
  end

  context do
    it 'requires a date' do
      expect(Game.new(@valid_attributes.merge(played_at: nil))).to_not be_valid
    end

    it 'requires a winner' do
      expect(Game.new(@valid_attributes.merge(winner: nil))).to_not be_valid
    end

    it 'requires a loser' do
      expect(Game.new(@valid_attributes.merge(loser: nil))).to_not be_valid
    end

    it 'require a score of each player' do
      expect(Game.new(@valid_attributes.merge(winner_score: -1))).to_not be_valid
      expect(Game.new(@valid_attributes.merge(loser_score: -1))).to_not be_valid
    end
  end

  context 'Game Points' do
    it 'max score is 21' do
      expect(Game.new(@valid_attributes.merge(winner_score: 22))).to_not be_valid
    end
    it 'min score is 0' do
      expect(Game.new(@valid_attributes.merge(winner_score: -1))).to_not be_valid
    end

    it 'a victory requires a two point difference' do
      game = Game.new(@valid_attributes.merge(winner_score: 21, loser_score: 21))
      expect(game).to_not be_valid

      game = Game.new(@valid_attributes.merge(winner_score: 21, loser_score: 20))
      expect(game).to_not be_valid

      game = Game.new(@valid_attributes.merge(winner_score: 21, loser_score: 19))
      expect(game).to be_valid

      game = Game.new(@valid_attributes.merge(winner_score: 21, loser_score: 2))
      expect(game).to be_valid
    end
  end
end
