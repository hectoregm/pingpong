require 'rails_helper'

RSpec.describe Game, type: :model do

  before do
    @valid_attributes = { played_at: Time.now,
                          winner: User.create(email: 'foo@regalii.com', password: 'secret123') }
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
  end
  
end
