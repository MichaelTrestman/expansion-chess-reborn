class AI
  def initialize(args = {})
    @args = args
    @starting_board = args.fetch(:starting_board)
    @current_turn = args.fetch(:current_turn)
    @current_piece_placement = args.fetch(:current_piece_placement).map(&:symbolize_keys)
  end

  def pick_random_move
    all_tha_moves = []
    current_turn_pieces.each do |piece|
      args = @args.clone
      args[:focal_piece] = piece
      this_piece_moves = MovesCalculator.new(args).calculate_moves
      this_piece_moves.each do |move|
        all_tha_moves << { piece => move }
      end
    end
    all_tha_moves.sample
  end

  def current_turn_pieces
    @current_turn_pieces ||= @current_piece_placement.select{|piece| piece[:side] == @current_turn}
  end

end