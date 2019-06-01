class BoardStateUpdater
  def initialize(args = {})
    @focal_piece = args.fetch(:focal_piece)
    @current_piece_placement = args.fetch(:current_piece_placement)
    @walls = args.fetch(:walls)
    @upgrade_squares = args.fetch(:upgrade_squares)
    @proposed_move = args.fetch(:proposed_move)
  end

  def compute_new_piece_placement
    new_piece_placement = @current_piece_placement.clone
    old_piece = new_piece_placement.delete(@focal_piece)

    i = new_piece_placement.index do |piece|
      piece[:posx] == @proposed_move[:posx]
      piece[:posy] == @proposed_move[:posy]
    end
    new_piece_placement.delete_at i unless i.nil?

    unless @proposed_move[:killed_piece].nil?
      piece_to_kill = {}
      piece_to_kill["type"] = @proposed_move[:killed_piece][:type]
      piece_to_kill["side"] = @proposed_move[:killed_piece][:side]
      piece_to_kill["posx"] = @proposed_move[:posx].to_s
      piece_to_kill["posy"] = @proposed_move[:posy].to_s

      dead_piece = new_piece_placement.delete(piece_to_kill)
      raise "can't find piece to kill:\n\n#{new_piece_placement}\n\n#{piece_to_kill}" if dead_piece.nil?
    end
    new_piece_placement << {
      posx: @proposed_move[:posx].to_s,
      posy: @proposed_move[:posy].to_s,
      type: @focal_piece[:type],
      side: @focal_piece[:side]
    }
    new_piece_placement
  end

end