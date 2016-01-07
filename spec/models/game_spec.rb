require 'rails_helper'

RSpec.describe Game, type: :model do

  before do
    @valid_game = Game.new(played: Time.now)
  end

  it 'is sane' do
    expect(@valid_game).to be_valid
  end
  
end
