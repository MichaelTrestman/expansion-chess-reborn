class GamesController < ApplicationController

  def index


    @games = firebase_client.get('games').body
  end
  def calculate_moves (board, chosen_piece)

  end
  def show
    game_data = firebase_client.get("games/#{params[:id]}").body
    board_stack = game_data["boardStack"]
    @current_board_state = JSON.parse(board_stack.pop)
    @board_height = @current_board_state["height"]
    @board_width = @current_board_state["width"]
  end

  private

  def firebase_client

    config.firebase_client_data = {
    url: "https://xchess-a3561.firebaseio.com",
    private_key_json: File.open("/Users/michaeltrestman/keys/xchess-a3561-firebase-adminsdk-2hn8l-2e1b6600b5.json").read
  }
    @firebase = Firebase::Client.new(config.firebase_client_data[:url], config.firebase_client_data[:private_key_json])
  end
end
