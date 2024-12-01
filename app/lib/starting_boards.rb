class StartingBoards
  @@boards = {}
  def self.boards
    return @@boards
  end
  def self.add_board name, board
    @@boards[name.to_sym] = board
  end
  def self.get_board name
    return @@boards[name.to_sym]
  end
end
StartingBoards.add_board :eye_of_the_storm, {
  "starting board name" => "eye of the storm",
  "height" => 11,
  "width" => 10,
  "walls" => [{"posx" => "3","posy" => "3"},{"posx" => "4","posy" => "3"},{"posx" => "5","posy" => "3"},{"posx" => "6","posy" => "3"},{"posx" => "2","posy" => "4"},{"posx" => "7","posy" => "4"},{"posx" => "2","posy" => "6"},{"posx" => "7","posy" => "6"},{"posx" => "3","posy" => "7"},{"posx" => "4","posy" => "7"},{"posx" => "5","posy" => "7"},{"posx" => "6","posy" => "7"}],
  "upgradeSquares" => [{"posx" => "4","posy" => "5"},{"posx" => "5","posy" => "5"}],
  "boardStack" => [[{"posx" => "1","posy" => "0","type" => "rook","side" => "white"},{"posx" => "2","posy" => "0","type" => "knight","side" => "white"},{"posx" => "3","posy" => "0","type" => "bishop","side" => "white"},{"posx" => "4","posy" => "0","type" => "queen","side" => "white"},{"posx" => "5","posy" => "0","type" => "king","side" => "white"},{"posx" => "6","posy" => "0","type" => "bishop","side" => "white"},{"posx" => "7","posy" => "0","type" => "knight","side" => "white"},{"posx" => "8","posy" => "0","type" => "rook","side" => "white"},{"posx" => "1","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "2","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "3","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "4","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "5","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "6","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "7","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "8","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "1","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "2","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "3","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "4","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "5","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "6","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "7","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "8","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "1","posy" => "10","type" => "rook","side" => "black"},{"posx" => "2","posy" => "10","type" => "knight","side" => "black"},{"posx" => "3","posy" => "10","type" => "bishop","side" => "black"},{"posx" => "4","posy" => "10","type" => "queen","side" => "black"},{"posx" => "5","posy" => "10","type" => "king","side" => "black"},{"posx" => "6","posy" => "10","type" => "bishop","side" => "black"},{"posx" => "7","posy" => "10","type" => "knight","side" => "black"},{"posx" => "8","posy" => "10","type" => "rook","side" => "black"}]],
  "turn" => "white",
  "playerSides" =>  {
    "white" => "unassigned",
    "black" => "unassigned"
  }
}
StartingBoards.add_board :knife_fight_in_an_elevator, {
  "starting board name" => "knife_fight_in_an_elevator",
  "height" => 9,
  "width" => 9,
  "walls" => [
    {"posx":"2","posy":"2"},
    {"posx":"6","posy":"2"},
    {"posx":"2","posy":"3"},
    {"posx":"6","posy":"3"},
    {"posx":"3","posy":"4"},
    {"posx":"5","posy":"4"},
    {"posx":"2","posy":"5"},
    {"posx":"6","posy":"5"},
    {"posx":"2","posy":"6"},
    {"posx":"6","posy":"6"}
  ],
  "upgradeSquares" => [{"posx":"4","posy":"4"}],
  "boardStack" => [[{"posx":"3","posy":"1","type":"pawn","side":"black"},{"posx":"4","posy":"1","type":"queen","side":"black"},{"posx":"5","posy":"1","type":"pawn","side":"black"},{"posx":"3","posy":"2","type":"rook","side":"black"},{"posx":"4","posy":"2","type":"king","side":"black"},{"posx":"5","posy":"2","type":"rook","side":"black"},{"posx":"3","posy":"3","type":"knight","side":"black"},{"posx":"5","posy":"3","type":"knight","side":"black"},{"posx":"3","posy":"5","type":"knight","side":"white"},{"posx":"5","posy":"5","type":"knight","side":"white"},{"posx":"3","posy":"6","type":"rook","side":"white"},{"posx":"4","posy":"6","type":"king","side":"white"},{"posx":"5","posy":"6","type":"rook","side":"white"},{"posx":"3","posy":"7","type":"pawn","side":"white"},{"posx":"4","posy":"7","type":"queen","side":"white"},{"posx":"5","posy":"7","type":"pawn","side":"white"}]],
  "turn" => "white",
  "playerSides" =>  {
    "white" => "unassigned",
    "black" => "unassigned"
  }
}


StartingBoards.add_board :mini_something, {
  "starting board name" => "mini_something",
  "height" => 12,
  "width" => 12,
  "walls" => [{"posx"=>"9","posy"=>"1","type"=>"wall"},{"posx"=>"4","posy"=>"2","type"=>"wall"},{"posx"=>"9","posy"=>"2","type"=>"wall"},{"posx"=>"10","posy"=>"2","type"=>"wall"},{"posx"=>"2","posy"=>"3","type"=>"wall"},{"posx"=>"3","posy"=>"3","type"=>"wall"},{"posx"=>"4","posy"=>"3","type"=>"wall"},{"posx"=>"7","posy"=>"8","type"=>"wall"},{"posx"=>"8","posy"=>"8","type"=>"wall"},{"posx"=>"9","posy"=>"8","type"=>"wall"},{"posx"=>"1","posy"=>"9","type"=>"wall"},{"posx"=>"2","posy"=>"9","type"=>"wall"},{"posx"=>"7","posy"=>"9","type"=>"wall"},{"posx"=>"2","posy"=>"10","type"=>"wall"}],
  "upgradeSquares" => [{"posx":"10","posy":"1"},{"posx":"1","posy":"10"}],
  "boardStack" => [[{"posx"=>"0","posy"=>"0","type"=>"queen","side"=>"black"},{"posx"=>"1","posy"=>"0","type"=>"king","side"=>"black"},{"posx"=>"2","posy"=>"0","type"=>"rook","side"=>"black"},{"posx"=>"3","posy"=>"0","type"=>"pawn","side"=>"black"},{"posx"=>"4","posy"=>"0","type"=>"pawn","side"=>"black"},{"posx"=>"0","posy"=>"1","type"=>"rook","side"=>"black"},{"posx"=>"1","posy"=>"1","type"=>"bishop","side"=>"black"},{"posx"=>"2","posy"=>"1","type"=>"bishop","side"=>"black"},{"posx"=>"3","posy"=>"1","type"=>"pawn","side"=>"black"},{"posx"=>"4","posy"=>"1","type"=>"pawn","side"=>"black"},{"posx"=>"0","posy"=>"2","type"=>"pawn","side"=>"black"},{"posx"=>"1","posy"=>"2","type"=>"pawn","side"=>"black"},{"posx"=>"2","posy"=>"2","type"=>"knight","side"=>"black"},{"posx"=>"3","posy"=>"2","type"=>"knight","side"=>"black"},{"posx"=>"0","posy"=>"3","type"=>"pawn","side"=>"black"},{"posx"=>"1","posy"=>"3","type"=>"pawn","side"=>"black"},{"posx"=>"10","posy"=>"8","type"=>"pawn","side"=>"white"},{"posx"=>"11","posy"=>"8","type"=>"pawn","side"=>"white"},{"posx"=>"8","posy"=>"9","type"=>"knight","side"=>"white"},{"posx"=>"9","posy"=>"9","type"=>"knight","side"=>"white"},{"posx"=>"10","posy"=>"9","type"=>"pawn","side"=>"white"},{"posx"=>"11","posy"=>"9","type"=>"pawn","side"=>"white"},{"posx"=>"7","posy"=>"10","type"=>"pawn","side"=>"white"},{"posx"=>"8","posy"=>"10","type"=>"pawn","side"=>"white"},{"posx"=>"9","posy"=>"10","type"=>"bishop","side"=>"white"},{"posx"=>"10","posy"=>"10","type"=>"bishop","side"=>"white"},{"posx"=>"11","posy"=>"10","type"=>"rook","side"=>"white"},{"posx"=>"7","posy"=>"11","type"=>"pawn","side"=>"white"},{"posx"=>"8","posy"=>"11","type"=>"pawn","side"=>"white"},{"posx"=>"9","posy"=>"11","type"=>"rook","side"=>"white"},{"posx"=>"10","posy"=>"11","type"=>"king","side"=>"white"},{"posx"=>"11","posy"=>"11","type"=>"queen","side"=>"white"}]],
  "turn" => "white",
  "playerSides" =>  {
    "white" => "unassigned",
    "black" => "unassigned"
  }
}


StartingBoards.add_board :mandala, {
  "starting board name" => "mandala",
  "height" => 24,
  "width" => 24,
  "walls" => [{"posx" => "4","posy" => "2"},{"posx" => "10","posy" => "2"},{"posx" => "13","posy" => "2"},{"posx" => "19","posy" => "2"},{"posx" => "4","posy" => "3"},{"posx" => "10","posy" => "3"},{"posx" => "11","posy" => "3"},{"posx" => "12","posy" => "3"},{"posx" => "13","posy" => "3"},{"posx" => "19","posy" => "3"},{"posx" => "2","posy" => "4"},{"posx" => "3","posy" => "4"},{"posx" => "20","posy" => "4"},{"posx" => "21","posy" => "4"},{"posx" => "10","posy" => "7"},{"posx" => "11","posy" => "7"},{"posx" => "12","posy" => "7"},{"posx" => "13","posy" => "7"},{"posx" => "9","posy" => "9"},{"posx" => "10","posy" => "9"},{"posx" => "13","posy" => "9"},{"posx" => "14","posy" => "9"},{"posx" => "7","posy" => "10"},{"posx" => "9","posy" => "10"},{"posx" => "14","posy" => "10"},{"posx" => "16","posy" => "10"},{"posx" => "1","posy" => "11"},{"posx" => "7","posy" => "11"},{"posx" => "16","posy" => "11"},{"posx" => "22","posy" => "11"},{"posx" => "1","posy" => "12"},{"posx" => "7","posy" => "12"},{"posx" => "16","posy" => "12"},{"posx" => "22","posy" => "12"},{"posx" => "7","posy" => "13"},{"posx" => "9","posy" => "13"},{"posx" => "14","posy" => "13"},{"posx" => "16","posy" => "13"},{"posx" => "9","posy" => "14"},{"posx" => "10","posy" => "14"},{"posx" => "13","posy" => "14"},{"posx" => "14","posy" => "14"},{"posx" => "10","posy" => "16"},{"posx" => "11","posy" => "16"},{"posx" => "12","posy" => "16"},{"posx" => "13","posy" => "16"},{"posx" => "2","posy" => "19"},{"posx" => "3","posy" => "19"},{"posx" => "20","posy" => "19"},{"posx" => "21","posy" => "19"},{"posx" => "4","posy" => "20"},{"posx" => "10","posy" => "20"},{"posx" => "11","posy" => "20"},{"posx" => "12","posy" => "20"},{"posx" => "13","posy" => "20"},{"posx" => "19","posy" => "20"},{"posx" => "4","posy" => "21"},{"posx" => "10","posy" => "21"},{"posx" => "13","posy" => "21"},{"posx" => "19","posy" => "21"}],
  "upgradeSquares" => [{"posx" => "11","posy" => "10"},{"posx" => "11","posy" => "11"},{"posx" => "11","posy" => "12"},{"posx" => "11","posy" => "13"},{"posx" => "12","posy" => "10"},{"posx" => "12","posy" => "11"},{"posx" => "12","posy" => "12"},{"posx" => "12","posy" => "13"},{"posx" => "13","posy" => "10"},{"posx" => "13","posy" => "11"},{"posx" => "13","posy" => "12"},{"posx" => "13","posy" => "13"},{"posx" => "10","posy" => "10"},{"posx" => "10","posy" => "11"},{"posx" => "10","posy" => "12"},{"posx" => "10","posy" => "13"}],
  "boardStack" => [[{"posx" => "1","posy" => "1","type" => "rook","side" => "black"},{"posx" => "10","posy" => "1","type" => "pawn","side" => "black"},{"posx" => "11","posy" => "1","type" => "pawn","side" => "black"},{"posx" => "12","posy" => "1","type" => "pawn","side" => "black"},{"posx" => "13","posy" => "1","type" => "pawn","side" => "black"},{"posx" => "22","posy" => "1","type" => "rook","side" => "black"},{"posx" => "2","posy" => "2","type" => "queen","side" => "black"},{"posx" => "3","posy" => "2","type" => "knight","side" => "black"},{"posx" => "11","posy" => "2","type" => "king","side" => "black"},{"posx" => "12","posy" => "2","type" => "knight","side" => "black"},{"posx" => "20","posy" => "2","type" => "knight","side" => "black"},{"posx" => "21","posy" => "2","type" => "queen","side" => "black"},{"posx" => "2","posy" => "3","type" => "knight","side" => "black"},{"posx" => "3","posy" => "3","type" => "bishop","side" => "black"},{"posx" => "20","posy" => "3","type" => "bishop","side" => "black"},{"posx" => "21","posy" => "3","type" => "knight","side" => "black"},{"posx" => "10","posy" => "5","type" => "pawn","side" => "black"},{"posx" => "11","posy" => "5","type" => "pawn","side" => "black"},{"posx" => "12","posy" => "5","type" => "pawn","side" => "black"},{"posx" => "13","posy" => "5","type" => "pawn","side" => "black"},{"posx" => "5","posy" => "10","type" => "pawn","side" => "black"},{"posx" => "18","posy" => "10","type" => "pawn","side" => "white"},{"posx" => "5","posy" => "11","type" => "pawn","side" => "black"},{"posx" => "18","posy" => "11","type" => "pawn","side" => "white"},{"posx" => "5","posy" => "12","type" => "pawn","side" => "black"},{"posx" => "18","posy" => "12","type" => "pawn","side" => "white"},{"posx" => "5","posy" => "13","type" => "pawn","side" => "black"},{"posx" => "18","posy" => "13","type" => "pawn","side" => "white"},{"posx" => "10","posy" => "18","type" => "pawn","side" => "white"},{"posx" => "11","posy" => "18","type" => "pawn","side" => "white"},{"posx" => "12","posy" => "18","type" => "pawn","side" => "white"},{"posx" => "13","posy" => "18","type" => "pawn","side" => "white"},{"posx" => "2","posy" => "20","type" => "knight","side" => "white"},{"posx" => "3","posy" => "20","type" => "bishop","side" => "white"},{"posx" => "20","posy" => "20","type" => "bishop","side" => "white"},{"posx" => "21","posy" => "20","type" => "knight","side" => "white"},{"posx" => "2","posy" => "21","type" => "queen","side" => "white"},{"posx" => "3","posy" => "21","type" => "knight","side" => "white"},{"posx" => "11","posy" => "21","type" => "king","side" => "white"},{"posx" => "12","posy" => "21","type" => "knight","side" => "white"},{"posx" => "20","posy" => "21","type" => "knight","side" => "white"},{"posx" => "21","posy" => "21","type" => "queen","side" => "white"},{"posx" => "1","posy" => "22","type" => "rook","side" => "white"},{"posx" => "10","posy" => "22","type" => "pawn","side" => "white"},{"posx" => "11","posy" => "22","type" => "pawn","side" => "white"},{"posx" => "12","posy" => "22","type" => "pawn","side" => "white"},{"posx" => "13","posy" => "22","type" => "pawn","side" => "white"},{"posx" => "22","posy" => "22","type" => "rook","side" => "white"}]],
  "turn" => "white",
  "playerSides" =>  {
    "white" => "unassigned",
    "black" => "unassigned"
  }
}


