class BoardStateUpdater
  def initialize(args = {})
    @focal_piece = args.fetch(:focal_piece)
    @current_piece_placement = args.fetch(:current_piece_placement)
    @upgrade_squares = args.fetch(:upgrade_squares)
    @proposed_move = args.fetch(:proposed_move)
  end

  def compute_new_piece_placement
    new_piece_placement = @current_piece_placement.clone
    old_piece = new_piece_placement.delete(@focal_piece)

    unless @proposed_move[:killed_piece].nil?
      piece_to_kill = {}
      piece_to_kill[:type] = @proposed_move[:killed_piece][:type]
      piece_to_kill[:side] = @proposed_move[:killed_piece][:side]
      piece_to_kill[:posx] = @proposed_move[:posx].to_s
      piece_to_kill[:posy] = @proposed_move[:posy].to_s

      dead_piece = new_piece_placement.delete(piece_to_kill)

      raise "can't find piece to kill:\n\n#{new_piece_placement}\n\n#{dead_piece}" if dead_piece.nil?
    end

    focal_piece_after_move = {
      posx: @proposed_move[:posx].to_s,
      posy: @proposed_move[:posy].to_s,
      type: @focal_piece[:type],
      side: @focal_piece[:side]
    }

    if focal_piece_after_move[:type] == 'pawn' && @upgrade_squares.include?({
        posx: focal_piece_after_move[:posx],
        posy: focal_piece_after_move[:posy]
      })
      focal_piece_after_move[:type] = 'queen'
    end

    new_piece_placement << focal_piece_after_move

    if !!@proposed_move[:killed_piece]
      raise 'failed to remove dead piece' unless new_piece_placement.count < @current_piece_placement.count
    end

    new_piece_placement
  end

end