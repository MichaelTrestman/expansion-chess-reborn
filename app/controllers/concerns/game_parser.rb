GameDataObject = Struct.new(:posx, :posy, :type, :side, :boardStack, :playerSides, :turn, :height, :width, :walls, :upgradeSquares, :lastUpdate, :black, :white, :red, :blue, :'starting board name', :current_piece_placement)

Wall = Struct.new(:x, :y)
UpgradeSquare = Struct.new(:x, :y)
PlayerSides = Struct.new(:black, :white, :red, :blue)

module GameParser
  def self.parse_game_state game_state_json

    raw_game_data = JSON.parse(game_state_json, object_class: GameDataObject)

    current_board_state = raw_game_data.boardStack.last.map do |piece|

      p = Piece.new
      p.x = piece.posx
      p.y = piece.posy
      p.type = piece.type
      p.side = piece.side
      p

    end

    walls = raw_game_data.walls.map do |wall|
      w = Wall.new
      w.x = wall.posx
      w.y = wall.posy
      w
    end

    upgrade_squares = raw_game_data.upgradeSquares.map do |upgrade_square|
      us = UpgradeSquare.new
      us.x = upgrade_square.posx
      us.y = upgrade_square.posy
      us
    end

    new_game_data = GameDataObject.new
    new_game_data.current_piece_placement = current_board_state
    new_game_data.turn = raw_game_data.turn
    new_game_data.walls = walls
    new_game_data.upgradeSquares = upgrade_squares
    new_game_data.height = raw_game_data.height
    new_game_data.width = raw_game_data.width
    return new_game_data
  end
end