class MovesController < ApplicationController

  def submit_move
    push_move(args) if new_move_calculator.move_is_valid? proposed_move
  end

  def calculate_moves (args = {})
    possible_moves = new_move_calculator.calculate_moves
    render :json => possible_moves
  end
  def move_params
    params.require(:move_data).permit(:game_ref, :starting_board, :chosen_piece => [:posx, :posy, :side, :type], :proposed_move => [:posx, :posy, :killed_piece_type, :killed_piece_side])
  end

  def current_piece_placement
    boardStack_ref = "#{move_params[:game_ref]}/boardStack"
    firebase_client.get(boardStack_ref).body.pop
  end

  def proposed_move
    proposed_move = {
      posx: move_params[:proposed_move][:posx],
      posy: move_params[:proposed_move][:posy]
    }
    if move_params[:proposed_move].nil?
      proposed_move[:killed_piece] = nil
    else
      proposed_move[:killed_piece] = {
        type: move_params[:proposed_move][:killed_piece_type],
        side: move_params[:proposed_move][:killed_piece_side]
      }
    end
    proposed_move
  end

  def new_move_calculator
    MovesCalculator.new(move_calculator_args)
  end

  def move_calculator_args
    focal_piece = move_params[:chosen_piece]
    starting_board = StartingBoards.get_board(move_params[:starting_board].to_sym)
    game_ref = move_params[:game_ref]
    {
      starting_board: starting_board,
      current_piece_placement: current_piece_placement,
      focal_piece: focal_piece
    }
  end

  def firebase_client

    firebase_client_data = {
      url: "https://xchess-a3561.firebaseio.com",
      private_key_json: File.open("/Users/michaeltrestman/keys/xchess-a3561-firebase-adminsdk-2hn8l-2e1b6600b5.json").read
    }
    @firebase = Firebase::Client.new(firebase_client_data[:url], firebase_client_data[:private_key_json])
  end
end