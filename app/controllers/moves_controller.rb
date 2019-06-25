class MovesController < ApplicationController

  include GameData

  def submit_move
    if new_move_calculator.move_is_valid?(proposed_move)
      push_board( compute_new_piece_placement )
    else
      raise "move invalid!; #{proposed_move}"
    end
  end

  def take_back_last_move
    push_board( nil, true )
  end

  def calculate_moves
    possible_moves = new_move_calculator.calculate_moves
    render :json => possible_moves
  end

  def ai_move
    move_tuple = AI.new(move_calculator_args).pick_best_move_no_lookahead

    focal_piece = move_tuple.first
    move = move_tuple.last
    new_piece_placement = BoardStateUpdater.new(
      focal_piece: focal_piece,
      current_piece_placement: current_piece_placement,
      walls: walls,
      upgrade_squares: upgrade_squares,
      proposed_move: move
    ).compute_new_piece_placement
    push_board(new_piece_placement)
  end

  private

  def game_data
    @id = move_params[:game_ref]

    @game_data ||= games_db.find({_id: BSON::ObjectId(@id)}).first
  end

  def push_board( new_piece_placement, take_back=false)

    turn = current_turn
    sides = game_data[:playerSides].keys.map(&:to_s)
    new_turn = sides.find{|x| x != turn }

    board_stack = game_data[:boardStack]

    if take_back
      board_stack.pop
    else
      board_stack << new_piece_placement
    end

    game = games_db.find({_id: BSON::ObjectId(@id)})
    game.find_one_and_update('$set' => {boardStack: board_stack})
    game.find_one_and_update('$set' => {turn: new_turn})


  end

  def compute_new_piece_placement
    BoardStateUpdater.new(
      focal_piece: @focal_piece,
      current_piece_placement: current_piece_placement,
      walls: walls,
      upgrade_squares: upgrade_squares,
      proposed_move: proposed_move
    ).compute_new_piece_placement
  end


  def move_params
    params.require(:move_data).permit(:game_ref, :starting_board, :chosen_piece => [:posx, :posy, :side, :type], :proposed_move => [:posx, :posy, :killed_piece_type, :killed_piece_side])
  end
  def boardStack_ref
    "#{move_params[:game_ref]}/boardStack"
  end
  def current_piece_placement
    game_data[:boardStack].last
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

  def walls
    starting_board[:walls]
  end

  def upgrade_squares
    starting_board[:upgradeSquares]
  end

  def starting_board
    StartingBoards.get_board(move_params[:starting_board].to_sym).deep_symbolize_keys
  end
  def current_turn
    game_data[:turn]
  end

  def move_calculator_args
    @focal_piece = move_params[:chosen_piece].to_h.symbolize_keys
    {
      starting_board: starting_board,
      current_piece_placement: current_piece_placement,
      focal_piece: @focal_piece,
      current_turn: current_turn
    }
  end

end