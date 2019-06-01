class MovesController < ApplicationController

  def submit_move
    if new_move_calculator.move_is_valid?(proposed_move)
      puts 'move valid!'
      push_board( compute_new_piece_placement )
      change_turn
    else
      raise "move invalid!; #{proposed_move}"
    end
  end

  def change_turn
    game_data = firebase_client.get(move_params[:game_ref]).body
    puts "game_data: #{game_data}"
    turn = game_data["turn"]
    sides = game_data["playerSides"].keys
    new_turn = sides.find{|x| x != turn }
    response = firebase_client.update("#{move_params[:game_ref]}", turn: new_turn)

    puts 'turn response'
    puts response.body
  end

  def push_board( new_piece_placement)
    board_stack = firebase_client.get(boardStack_ref).body
    new_index = board_stack.length

    firebase_client.update(boardStack_ref, {new_index => new_piece_placement})

    render :json => {message: 'ok i think?'}

  end

  def compute_new_piece_placement
    new_piece_placement = current_piece_placement.clone
    old_piece = new_piece_placement.delete(@focal_piece)

    i = new_piece_placement.index do |piece|
      piece[:posx] == proposed_move[:posx]
      piece[:posy] == proposed_move[:posy]
    end
    new_piece_placement.delete_at i unless i.nil?

    unless proposed_move[:killed_piece].nil?
      piece_to_kill = {}
      piece_to_kill["type"] = proposed_move[:killed_piece][:type]
      piece_to_kill["side"] = proposed_move[:killed_piece][:side]
      piece_to_kill["posx"] = proposed_move[:posx].to_s
      piece_to_kill["posy"] = proposed_move[:posy].to_s

      dead_piece = new_piece_placement.delete(piece_to_kill)
      raise "can't find piece to kill:\n\n#{new_piece_placement}\n\n#{piece_to_kill}" if dead_piece.nil?
    end
    new_piece_placement << {
      posx: proposed_move[:posx].to_s,
      posy: proposed_move[:posy].to_s,
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
    firebase_client.get(boardStack_ref).body.last
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