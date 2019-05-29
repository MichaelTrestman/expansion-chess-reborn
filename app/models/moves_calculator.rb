class MovesCalculator

  def initialize(args = {})
    @starting_board = args.fetch(:starting_board)
    @current_piece_placement = args.fetch(:current_piece_placement)
    @focal_piece = args.fetch(:focal_piece)
    @move_set = []
  end

  def calculate_moves
    send(
      "moves_for_#{@focal_piece[:type]}")
  end

  def try_until_hit_something(current_space, direction)
    candidate_space = {
      posx: current_space[:posx] + direction[:x],
      posy: current_space[:posy] + direction[:y]
    }
    if space_available(candidate_space)[:movable]
      @move_set << candidate_space
      puts "trying again"
      try_until_hit_something(candidate_space, direction)
    end
    puts "giving up"

  end

  def space_is_off_board candidate_space
    return true if candidate_space[:posx] < 0
    return true if candidate_space[:posy] < 0
    return true if candidate_space[:posx] >= @starting_board["width"]
    return true if candidate_space[:posy] >= @starting_board["height"]
    return false
  end

  def try_once(current_space, direction)
    candidate_space = {
      posx: current_space[:posx] + direction[:x],
      posy: current_space[:posy] + direction[:y]
      #need to put pieces and walls in candidate space
    }

    result = space_available(candidate_space)
    if result[:movable]
      result.delete(:movable)
      @move_set << result
    end

  end

  def space_available(candidate_space)
    response = {movable: nil, killed_piece: nil}

    if space_is_off_board candidate_space
      response[:movable] = false
    elsif @starting_board["walls"].include?({
        posx: candidate_space[:posx],
        posy: candidate_space[:posy]
      })
      response[:movable] = false
    elsif @current_piece_placement.any? do |placed_piece|
      @placed_piece = placed_piece
      ( placed_piece[:posx] == candidate_space[:posx] ) &&
      ( placed_piece[:posy] == candidate_space[:posy] )
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
    puts 'bishop moves'
    diagonal_directions.each do |name, dir_hash|
      puts "trying #{name}"
      try_until_hit_something(current_space,dir_hash)
    end
  end

  def moves_for_king

  end

  def moves_for_queen
  end

  def moves_for_rook
  end

  def moves_for_knight
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


end