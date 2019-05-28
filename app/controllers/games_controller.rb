class GamesController < ApplicationController

  def new
    @board_names = StartingBoards.keys
  end

  def index
    @games = firebase_client.get('games').body
  end

  def show
    @game_path = "games/#{params[:id]}"
    game_data = firebase_client.get(@game_path).body
    raise "Missing Game" if game_data.nil?
    board_stack = game_data["boardStack"]
    @current_board_state = board_stack.pop
    @board_height = game_data["height"]
    @board_width = game_data["width"]
  end

  def calculate_moves (starting_board, current_piece_placement, chosen_piece)
    possible_moves = MovesCalculator.new(
      starting_board,
      current_piece_placement,
      chosen_piece
    ).calculate_moves

    render :json => possible_moves

  end


  private

  def firebase_client

    firebase_client_data = {
      url: "https://xchess-a3561.firebaseio.com",
      private_key_json: File.open("/Users/michaeltrestman/keys/xchess-a3561-firebase-adminsdk-2hn8l-2e1b6600b5.json").read
    }
    @firebase = Firebase::Client.new(firebase_client_data[:url], firebase_client_data[:private_key_json])
  end
end
