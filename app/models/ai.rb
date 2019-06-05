class AI
  def initialize(args = {})
    @args = args
    @starting_board = args.fetch(:starting_board)
    @current_turn = args.fetch(:current_turn)
    @current_piece_placement = args.fetch(:current_piece_placement)
  end

  def assemble_possible_moves(args)
    all_tha_moves = []
    current_turn_pieces.each do |piece|
      args[:focal_piece] = piece
      this_piece_moves = MovesCalculator.new(args).calculate_moves
      this_piece_moves.each do |move|
        all_tha_moves << [ piece, move ]
      end
    end
    all_tha_moves
  end

  def pick_the_best_move_lookahead_degree1
    args = @args.clone
    first_layer_of_moves = assemble_possible_moves(args)
    move_with_best_worst_case = first_layer_of_moves.map do |move_info|

      piece, move = move_info

      these_bsu_args = {
      focal_piece: piece,
      current_piece_placement: @current_piece_placement,
      upgrade_squares: @starting_board.fetch(:upgradeSquares),
      proposed_move: move
      }


      new_args = args.clone
      new_args[:current_piece_placement] = BoardStateUpdater.new(these_bsu_args).compute_new_piece_placement

      worst_case = value_for_move(pick_worst_move_no_lookahead new_args)

      [piece, move, worst_case]
    end.sort_by{|move| move.last }.max
    move_with_best_worst_case
  end

  def pick_worst_move_no_lookahead args
    assemble_possible_moves(args).sort_by{|x| value_for_move(x)}.first
  end
  def pick_best_move_no_lookahead
    args = @args.clone
    assemble_possible_moves(args).sort_by{|x| value_for_move(x)}.last
  end

  def pick_random_move
    assemble_possible_moves(@args).sample
  end

  def current_turn_pieces
    @current_turn_pieces ||= @current_piece_placement.select{|piece| piece[:side] == @current_turn}
  end

  def value_for_move move_tup
    piece, move = move_tup

    bsu_args = {
      focal_piece: piece,
      current_piece_placement: @current_piece_placement,
      upgrade_squares: @starting_board.fetch(:upgradeSquares),
      proposed_move: move
    }

    piece_placement = BoardStateUpdater.new(bsu_args).compute_new_piece_placement

    value_for_board_state(@current_turn, piece_placement)
  end

  def value_for_board_state(active_side,piece_placement)
    value = 0
    piece_placement.each do |piece|
      piece_valence = (piece[:side] == active_side) ? 1 : -1
      value += (piece_values[piece[:type].to_sym] * piece_valence)
   end
   value
  end

  def piece_values
    {
      pawn: 100,
      knight: 350,
      bishop: 350,
      rook: 525,
      queen: 1000,
      king: 20000
    }
  end

end