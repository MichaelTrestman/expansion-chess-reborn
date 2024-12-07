class MovesCalculator

  def initialize(args = {})
    @starting_board = args.fetch(:starting_board)
    @current_turn = args.fetch(:current_turn)
    @current_piece_placement = args.fetch(:current_piece_placement)
    @focal_piece = args.fetch(:focal_piece)
    @space_occupancy_registry = populate_space_occupancy_registry
    @move_set = []
  end

  def move_is_valid? proposed_move
    moves = calculate_moves
    moves.include? proposed_move
  end

  def populate_space_occupancy_registry
    registry = {}
    @starting_board[:walls].each do |wall|
      registry[ wall[:posx].to_i ] = {} if registry[ wall[:posx].to_i ].nil?
      registry[ wall[:posx].to_i ][ wall[:posy].to_i ] = 'wall'
    end
    @current_piece_placement.each do |piece|
      registry[ piece[:posx].to_i ] = {} if registry [ piece[:posx].to_i ].nil?
      registry[ piece[:posx].to_i ][ piece[:posy].to_i ] = {
        side: piece[:side],
        type: piece[:type]
      }
    end
    registry
  end

  def calculate_moves
    return [] unless @focal_piece[:side] == @current_turn
    send(
      "moves_for_#{@focal_piece[:type]}")
  end

  def moves_for_pawn
    cardinal_directions.each do |_, dir_hash|
      try_once(current_space, dir_hash)
    end
    no_kill_moves = @move_set.clone.select{|move| move[:killed_piece].nil? }
    @move_set = []

    diagonal_directions.each do |_, dir_hash|
      try_once(current_space, dir_hash)
    end

    kill_moves = @move_set.clone.select{|move| !move[:killed_piece].nil? }
    @move_set = []

    @move_set = no_kill_moves + kill_moves
  end

  def moves_for_bishop
    diagonal_directions.each do |name, dir_hash|
      try_until_hit_something(current_space,dir_hash)
    end
    @move_set
  end

  def moves_for_king
    cardinal_directions.each do |name, dir_hash|
      try_once(current_space,dir_hash)
    end
    diagonal_directions.each do |name, dir_hash|
      try_once(current_space,dir_hash)
    end
    @move_set
  end

  def moves_for_queen
    cardinal_directions.each do |name, dir_hash|
      try_until_hit_something(current_space,dir_hash)
    end
    diagonal_directions.each do |name, dir_hash|
      try_until_hit_something(current_space,dir_hash)
    end
    @move_set
  end

  def moves_for_rook
    cardinal_directions.each do |name, dir_hash|
      try_until_hit_something(current_space,dir_hash)
    end
    @move_set
  end

  def moves_for_knight
    knight_moves.each do |name, dir_hash|
      try_once(current_space,dir_hash)
    end
    @move_set
  end

  def space_is_off_board candidate_space
    return true if candidate_space[:posx] < 0
    return true if candidate_space[:posy] < 0
    return true if candidate_space[:posx] >= @starting_board[:width]
    return true if candidate_space[:posy] >= @starting_board[:height]
    return false
  end

  def try_once(current_space, direction)
    candidate_space = {
      posx: current_space[:posx] + direction[:x],
      posy: current_space[:posy] + direction[:y]
    }
    result = space_available(candidate_space)
    if !!result[:movable]
      result.delete(:movable)
      @move_set << result
    end
  end

  def try_until_hit_something(current_space, direction)
    candidate_space = {
      posx: current_space[:posx] + direction[:x],
      posy: current_space[:posy] + direction[:y]
    }
    result = space_available(candidate_space)
    if !!result[:movable]
      result.delete(:movable)
      @move_set << result
      try_until_hit_something(candidate_space, direction) unless result[:killed_piece]
    end
  end

  def space_available(candidate_space)
    return {movable: false, killed_piece: nil} if space_is_off_board(candidate_space)
    return {
      movable: true,
      killed_piece: nil,
      posx: candidate_space[:posx],
      posy:candidate_space[:posy]
    } if @space_occupancy_registry[ candidate_space[:posx] ].nil?
    case @space_occupancy_registry[ candidate_space[:posx] ][ candidate_space[:posy] ]
    when nil
      return {
        movable: true, killed_piece: nil,
        posx: candidate_space[:posx],
        posy:candidate_space[:posy]
      }
    when 'wall'
      return {movable: false, killed_piece: nil}
    when -> (space){ space[:side] == @focal_piece[:side] }
      return {movable: false, killed_piece: nil}
    else
      return {
        movable: true,
        posx: candidate_space[:posx],
        posy:candidate_space[:posy],
        killed_piece: @space_occupancy_registry[ candidate_space[:posx].to_i ][ candidate_space[:posy].to_i ]
      }
    end
  end


  def xspace_available(candidate_space)
    response = {movable: nil, killed_piece: nil}

    if space_is_off_board candidate_space
      response[:movable] = false
    elsif @starting_board[:walls].map { |wall| wall.each{|k,v| wall[k.to_sym] = v.to_i }  }.include?({
        posx: candidate_space[:posx],
        posy: candidate_space[:posy]
      })
      response[:movable] = false
    elsif @current_piece_placement.any? do |placed_piece|
      @placed_piece = placed_piece
      ( placed_piece[:posx].to_i == candidate_space[:posx] ) &&
      ( placed_piece[:posy].to_i == candidate_space[:posy] )
    end
      if (@placed_piece[:side] != @focal_piece[:side])
        response = {
          posx: candidate_space[:posx],
          posy: candidate_space[:posy],
          movable: true,
          killed_piece: {
            type: @placed_piece[:type],
            side: @placed_piece[:side]
          }
        }
      else
        response = {movable: false, killed_piece: nil}
      end
    else
      response = {
        posx: candidate_space[:posx],
        posy: candidate_space[:posy],
        movable: true,
        killed_piece: nil
      }
    end
    return response
  end

  def current_space
    @current_space ||= {posx: @focal_piece[:posx].to_i, posy: @focal_piece[:posy].to_i}
    @current_space
  end

  def cardinal_directions
    {
      north: {
        x: 0,
        y: -1
      },
      south: {
        x: 0,
        y: 1
      },
      east: {
        x: 1,
        y: 0
      },
      west: {
        x: -1,
        y: 0
      }
    }
  end

  def diagonal_directions
    {
      north_east: {
        x: 1,
        y: -1
      },
      south_east: {
        x: 1,
        y: 1
      },
      north_west: {
        x: -1,
        y: -1
      },
      south_west: {
        x: -1,
        y: 1
      }
    }
  end

  def knight_moves
    {
      north_north_east: {
        x: 1,
        y: -2,
      },
      north_north_west: {
        x: -1,
        y: -2
      },
      south_south_east: {
        x: 1,
        y: 2
      },
      south_south_west: {
        x: -1,
        y: 2
      },
      east_east_north: {
        x: 2,
        y: -1
      },
      east_east_south: {
        x: 2,
        y: 1
      },
      west_west_north: {
        x: -2,
        y: -1
      },
      west_west_south: {
        x: -2,
        y: 1
      }
    }
  end

end