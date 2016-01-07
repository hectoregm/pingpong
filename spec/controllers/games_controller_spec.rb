require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Game. As you add validations to Game, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { played_at: Time.now, }
  end

  let(:invalid_attributes) do
    { played_at: nil }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GamesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    sign_in
  end

  describe "GET #new" do
    it "assigns a new game as @game" do
      get :new, {}, valid_session
      expect(assigns(:game)).to be_a_new(Game)
    end
  end

end
