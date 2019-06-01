require 'rails_helper'

RSpec.describe MovesController, type: :controller do

  xdescribe "#GET #calculate_moves" do
    it "returns the set of valid moves for the selected piece" do

      get '/calculate_moves' => MovesController.new.calculate_moves, params: {
        move_data: {
          game_ref: "games/-Lg3PdEJNnGYLavxnq-0",
          starting_board: "mandala",
          chosen_piece: {
            posx: 1,
            posy: 1,
            side: "black",
            type: "rook"
          }
        }
      }


    end
  end

end