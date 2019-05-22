require 'rails_helper'

RSpec.describe GamesController, type: :controller do


  describe "#GET #calculate_moves" do
    it "returns the set of valid moves for the selected piece" do


    end
  end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
