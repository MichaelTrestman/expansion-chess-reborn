class MovesController < ApplicationController

  def submit_move
    if new_move_calculator.move_is_valid?(proposed_move)
      push_board( compute_new_piece_placement )
    else
      raise "move invalid!; #{proposed_move}"
    end
  end

  def push_board( new_piece_placement)
    @game_data ||= firebase_client.get(move_params[:game_ref]).body
    turn = @game_data["turn"]
    sides = @game_data["playerSides"].keys
    new_turn = sides.find{|x| x != turn }

    board_stack = @game_data["boardStack"]
    new_index = board_stack.length

    firebase_client.update('', {
      "#{boardStack_ref}/#{new_index}" => new_piece_placement,
      "#{move_params[:game_ref]}/turn" => new_turn
    })

    render :json => {message: 'ok i think?'}

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
    @game_data ||= firebase_client.get(move_params[:game_ref]).body
    @game_data["boardStack"].last
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
    starting_board[:upgrade_squares]
  end
  def starting_board
    StartingBoards.get_board(move_params[:starting_board].to_sym)
  end
  def move_calculator_args
    @focal_piece = move_params[:chosen_piece]
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