class MovesController < ApplicationController
  def calculate_moves (args = {})
    focal_piece = move_params[:chosen_piece]
    starting_board = StartingBoards.get_board(move_params[:starting_board].to_sym)
    game_ref = move_params[:game_ref]
    possible_moves = MovesCalculator.new(
      starting_board: starting_board,
      current_piece_placement: current_piece_placement,
      focal_piece: focal_piece
    ).calculate_moves

    render :json => possible_moves
  end
  def move_params
    params.require(:move_data).permit(:game_ref, :starting_board, :chosen_piece => [:posx, :posy, :side, :type])

    # params = JSON.parse(params)
    # puts "params"
    # puts params
    # params.require(:move_data).permit(:starting_board, :current_piece_placement, :chosen_piece)
  end

  def current_piece_placement

    boardStack_ref = "#{move_params[:game_ref]}/boardStack"

    firebase_client.get(boardStack_ref).body.pop
  end

  def firebase_client

    firebase_client_data = {
      url: "https://xchess-a3561.firebaseio.com",
      private_key_json: File.open("/Users/michaeltrestman/keys/xchess-a3561-firebase-adminsdk-2hn8l-2e1b6600b5.json").read
    }
    @firebase = Firebase::Client.new(firebase_client_data[:url], firebase_client_data[:private_key_json])
  end
end