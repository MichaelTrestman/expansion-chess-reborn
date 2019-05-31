class MovesController < ApplicationController

  def submit_move
    if new_move_calculator.move_is_valid?(proposed_move)
      puts 'move valid!'
      push_board( compute_new_piece_placement )
    else
      raise "move invalid!; #{proposed_move}"
    end
  end

  def push_board( new_piece_placement)
    board_stack = firebase_client.get(boardStack_ref).body
    new_index = board_stack.length

    firebase_client.update(boardStack_ref, {new_index => new_piece_placement})

    render :json => {message: 'ok i think?'}

  end

  def compute_new_piece_placement
    new_piece_placement = current_piece_placement.clone
    new_piece_placement.delete(@focal_piece)
    i = new_piece_placement.index do |piece|
      piece[:posx] == proposed_move[:posx]
      piece[:posy] == proposed_move[:posy]
    end
    new_piece_placement.delete_at i unless i.nil?
    new_piece_placement << {
      posx: proposed_move[:posx],
      posy: proposed_move[:posy],
      type: @focal_piece[:type],
      side: @focal_piece[:side]
    }
  end

  def calculate_moves (args = {})
    possible_moves = new_move_calculator.calculate_moves
    render :json => possible_moves
  end
  def move_params
    params.require(:move_data).permit(:game_ref, :starting_board, :chosen_piece => [:posx, :posy, :side, :type], :proposed_move => [:posx, :posy, :killed_piece_type, :killed_piece_side])
  end
  def boardStack_ref
    "#{move_params[:game_ref]}/boardStack"
  end
  def current_piece_placement
    firebase_client.get(boardStack_ref).body.pop
  end

  def proposed_move
    proposed_move = {
      posx: move_params[:proposed_move][:posx].to_i,
      posy: move_params[:proposed_move][:posy].to_i
    }
    if move_params[:proposed_move].nil?
      proposed_move[:killed_piece] = nil
    else
      proposed_move[:killed_piece] = {
        type: move_params[:proposed_move][:killed_piece_type],
        side: move_params[:proposed_move][:killed_piece_side]
      }
    end
    proposed_move[:killed_piece] = nil if proposed_move[:killed_piece][:type] == ''

    proposed_move
  end

  def new_move_calculator
    MovesCalculator.new(move_calculator_args)
  end

  def move_calculator_args
    @focal_piece = move_params[:chosen_piece]
    starting_board = StartingBoards.get_board(move_params[:starting_board].to_sym)
    game_ref = move_params[:game_ref]
    {
      starting_board: starting_board,
      current_piece_placement: current_piece_placement,
      focal_piece: @focal_piece
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