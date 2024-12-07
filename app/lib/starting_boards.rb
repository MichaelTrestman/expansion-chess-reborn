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
  "name" => "eye of the storm",
  "height" => 11,
  "width" => 10,
  "walls" => [
    {"posx" => "3","posy" => "3"},{"posx" => "4","posy" => "3"},{"posx" => "5","posy" => "3"},{"posx" => "6","posy" => "3"},{"posx" => "2","posy" => "4"},{"posx" => "7","posy" => "4"},{"posx" => "2","posy" => "6"},{"posx" => "7","posy" => "6"},{"posx" => "3","posy" => "7"},{"posx" => "4","posy" => "7"},{"posx" => "5","posy" => "7"},{"posx" => "6","posy" => "7"}],
  "upgradeSquares" => [{"posx" => "4","posy" => "5"},{"posx" => "5","posy" => "5"}],
  "boardStack" => [[{"posx" => "1","posy" => "0","type" => "rook","side" => "white"},{"posx" => "2","posy" => "0","type" => "knight","side" => "white"},{"posx" => "3","posy" => "0","type" => "bishop","side" => "white"},{"posx" => "4","posy" => "0","type" => "queen","side" => "white"},{"posx" => "5","posy" => "0","type" => "king","side" => "white"},{"posx" => "6","posy" => "0","type" => "bishop","side" => "white"},{"posx" => "7","posy" => "0","type" => "knight","side" => "white"},{"posx" => "8","posy" => "0","type" => "rook","side" => "white"},{"posx" => "1","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "2","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "3","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "4","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "5","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "6","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "7","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "8","posy" => "1","type" => "pawn","side" => "white"},{"posx" => "1","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "2","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "3","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "4","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "5","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "6","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "7","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "8","posy" => "9","type" => "pawn","side" => "black"},{"posx" => "1","posy" => "10","type" => "rook","side" => "black"},{"posx" => "2","posy" => "10","type" => "knight","side" => "black"},{"posx" => "3","posy" => "10","type" => "bishop","side" => "black"},{"posx" => "4","posy" => "10","type" => "queen","side" => "black"},{"posx" => "5","posy" => "10","type" => "king","side" => "black"},{"posx" => "6","posy" => "10","type" => "bishop","side" => "black"},{"posx" => "7","posy" => "10","type" => "knight","side" => "black"},{"posx" => "8","posy" => "10","type" => "rook","side" => "black"}]],
  "turn": "white",
  "playerSides": {
    "white": "unassigned",
    "black": "unassigned"
  }
  
}
StartingBoards.add_board :knife_fight_in_an_elevator, {
  "name" => "knife_fight_in_an_elevator",
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
  "name" => "mini_something",
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
  "name" => "mandala",
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

StartingBoards.add_board :shmoop,{
  "name": "shmoop",
  "height": 24,
  "width": 24,
  "walls": [
    {
      "posx": "11",
      "posy": "0"
    },
    {
      "posx": "12",
      "posy": "0"
    },
    {
      "posx": "11",
      "posy": "1"
    },
    {
      "posx": "12",
      "posy": "1"
    },
    {
      "posx": "5",
      "posy": "2"
    },
    {
      "posx": "11",
      "posy": "2"
    },
    {
      "posx": "12",
      "posy": "2"
    },
    {
      "posx": "18",
      "posy": "2"
    },
    {
      "posx": "5",
      "posy": "3"
    },
    {
      "posx": "8",
      "posy": "3"
    },
    {
      "posx": "9",
      "posy": "3"
    },
    {
      "posx": "10",
      "posy": "3"
    },
    {
      "posx": "11",
      "posy": "3"
    },
    {
      "posx": "12",
      "posy": "3"
    },
    {
      "posx": "13",
      "posy": "3"
    },
    {
      "posx": "14",
      "posy": "3"
    },
    {
      "posx": "15",
      "posy": "3"
    },
    {
      "posx": "18",
      "posy": "3"
    },
    {
      "posx": "5",
      "posy": "4"
    },
    {
      "posx": "18",
      "posy": "4"
    },
    {
      "posx": "2",
      "posy": "5"
    },
    {
      "posx": "3",
      "posy": "5"
    },
    {
      "posx": "4",
      "posy": "5"
    },
    {
      "posx": "5",
      "posy": "5"
    },
    {
      "posx": "18",
      "posy": "5"
    },
    {
      "posx": "19",
      "posy": "5"
    },
    {
      "posx": "20",
      "posy": "5"
    },
    {
      "posx": "21",
      "posy": "5"
    },
    {
      "posx": "3",
      "posy": "8"
    },
    {
      "posx": "20",
      "posy": "8"
    },
    {
      "posx": "3",
      "posy": "9"
    },
    {
      "posx": "20",
      "posy": "9"
    },
    {
      "posx": "3",
      "posy": "10"
    },
    {
      "posx": "20",
      "posy": "10"
    },
    {
      "posx": "0",
      "posy": "11"
    },
    {
      "posx": "1",
      "posy": "11"
    },
    {
      "posx": "2",
      "posy": "11"
    },
    {
      "posx": "3",
      "posy": "11"
    },
    {
      "posx": "20",
      "posy": "11"
    },
    {
      "posx": "21",
      "posy": "11"
    },
    {
      "posx": "22",
      "posy": "11"
    },
    {
      "posx": "23",
      "posy": "11"
    },
    {
      "posx": "0",
      "posy": "12"
    },
    {
      "posx": "1",
      "posy": "12"
    },
    {
      "posx": "2",
      "posy": "12"
    },
    {
      "posx": "3",
      "posy": "12"
    },
    {
      "posx": "20",
      "posy": "12"
    },
    {
      "posx": "21",
      "posy": "12"
    },
    {
      "posx": "22",
      "posy": "12"
    },
    {
      "posx": "23",
      "posy": "12"
    },
    {
      "posx": "3",
      "posy": "13"
    },
    {
      "posx": "20",
      "posy": "13"
    },
    {
      "posx": "3",
      "posy": "14"
    },
    {
      "posx": "20",
      "posy": "14"
    },
    {
      "posx": "3",
      "posy": "15"
    },
    {
      "posx": "20",
      "posy": "15"
    },
    {
      "posx": "2",
      "posy": "18"
    },
    {
      "posx": "3",
      "posy": "18"
    },
    {
      "posx": "4",
      "posy": "18"
    },
    {
      "posx": "5",
      "posy": "18"
    },
    {
      "posx": "18",
      "posy": "18"
    },
    {
      "posx": "19",
      "posy": "18"
    },
    {
      "posx": "20",
      "posy": "18"
    },
    {
      "posx": "21",
      "posy": "18"
    },
    {
      "posx": "5",
      "posy": "19"
    },
    {
      "posx": "18",
      "posy": "19"
    },
    {
      "posx": "5",
      "posy": "20"
    },
    {
      "posx": "8",
      "posy": "20"
    },
    {
      "posx": "9",
      "posy": "20"
    },
    {
      "posx": "10",
      "posy": "20"
    },
    {
      "posx": "11",
      "posy": "20"
    },
    {
      "posx": "12",
      "posy": "20"
    },
    {
      "posx": "13",
      "posy": "20"
    },
    {
      "posx": "14",
      "posy": "20"
    },
    {
      "posx": "15",
      "posy": "20"
    },
    {
      "posx": "18",
      "posy": "20"
    },
    {
      "posx": "5",
      "posy": "21"
    },
    {
      "posx": "11",
      "posy": "21"
    },
    {
      "posx": "12",
      "posy": "21"
    },
    {
      "posx": "18",
      "posy": "21"
    },
    {
      "posx": "11",
      "posy": "22"
    },
    {
      "posx": "12",
      "posy": "22"
    },
    {
      "posx": "11",
      "posy": "23"
    },
    {
      "posx": "12",
      "posy": "23"
    }
  ],
  "upgradeSquares": [
    {
      "posx": "11",
      "posy": "11"
    },
    {
      "posx": "11",
      "posy": "12"
    },
    {
      "posx": "12",
      "posy": "11"
    },
    {
      "posx": "12",
      "posy": "12"
    }
  ],
  "boardStack": [
    [
      {
        "posx": "8",
        "posy": "1",
        "type": "bishop",
        "side": "black"
      },
      {
        "posx": "9",
        "posy": "1",
        "type": "bishop",
        "side": "black"
      },
      {
        "posx": "14",
        "posy": "1",
        "type": "knight",
        "side": "red"
      },
      {
        "posx": "15",
        "posy": "1",
        "type": "knight",
        "side": "red"
      },
      {
        "posx": "2",
        "posy": "2",
        "type": "queen",
        "side": "black"
      },
      {
        "posx": "3",
        "posy": "2",
        "type": "rook",
        "side": "black"
      },
      {
        "posx": "6",
        "posy": "2",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "7",
        "posy": "2",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "16",
        "posy": "2",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "17",
        "posy": "2",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "20",
        "posy": "2",
        "type": "rook",
        "side": "red"
      },
      {
        "posx": "21",
        "posy": "2",
        "type": "queen",
        "side": "red"
      },
      {
        "posx": "2",
        "posy": "3",
        "type": "rook",
        "side": "black"
      },
      {
        "posx": "3",
        "posy": "3",
        "type": "king",
        "side": "black"
      },
      {
        "posx": "6",
        "posy": "3",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "7",
        "posy": "3",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "16",
        "posy": "3",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "17",
        "posy": "3",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "20",
        "posy": "3",
        "type": "king",
        "side": "red"
      },
      {
        "posx": "21",
        "posy": "3",
        "type": "rook",
        "side": "red"
      },
      {
        "posx": "2",
        "posy": "6",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "3",
        "posy": "6",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "20",
        "posy": "6",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "21",
        "posy": "6",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "2",
        "posy": "7",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "3",
        "posy": "7",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "20",
        "posy": "7",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "21",
        "posy": "7",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "1",
        "posy": "8",
        "type": "knight",
        "side": "black"
      },
      {
        "posx": "22",
        "posy": "8",
        "type": "bishop",
        "side": "red"
      },
      {
        "posx": "1",
        "posy": "9",
        "type": "knight",
        "side": "black"
      },
      {
        "posx": "22",
        "posy": "9",
        "type": "bishop",
        "side": "red"
      },
      {
        "posx": "1",
        "posy": "14",
        "type": "bishop",
        "side": "white"
      },
      {
        "posx": "22",
        "posy": "14",
        "type": "knight",
        "side": "blue"
      },
      {
        "posx": "1",
        "posy": "15",
        "type": "bishop",
        "side": "white"
      },
      {
        "posx": "22",
        "posy": "15",
        "type": "knight",
        "side": "blue"
      },
      {
        "posx": "2",
        "posy": "16",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "3",
        "posy": "16",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "20",
        "posy": "16",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "21",
        "posy": "16",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "2",
        "posy": "17",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "3",
        "posy": "17",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "20",
        "posy": "17",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "21",
        "posy": "17",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "2",
        "posy": "20",
        "type": "rook",
        "side": "white"
      },
      {
        "posx": "3",
        "posy": "20",
        "type": "king",
        "side": "white"
      },
      {
        "posx": "6",
        "posy": "20",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "7",
        "posy": "20",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "16",
        "posy": "20",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "17",
        "posy": "20",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "20",
        "posy": "20",
        "type": "king",
        "side": "blue"
      },
      {
        "posx": "21",
        "posy": "20",
        "type": "rook",
        "side": "blue"
      },
      {
        "posx": "2",
        "posy": "21",
        "type": "queen",
        "side": "white"
      },
      {
        "posx": "3",
        "posy": "21",
        "type": "rook",
        "side": "white"
      },
      {
        "posx": "6",
        "posy": "21",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "7",
        "posy": "21",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "16",
        "posy": "21",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "17",
        "posy": "21",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "20",
        "posy": "21",
        "type": "rook",
        "side": "blue"
      },
      {
        "posx": "21",
        "posy": "21",
        "type": "queen",
        "side": "blue"
      },
      {
        "posx": "8",
        "posy": "22",
        "type": "knight",
        "side": "white"
      },
      {
        "posx": "9",
        "posy": "22",
        "type": "knight",
        "side": "white"
      },
      {
        "posx": "14",
        "posy": "22",
        "type": "bishop",
        "side": "blue"
      },
      {
        "posx": "15",
        "posy": "22",
        "type": "bishop",
        "side": "blue"
      }
    ]
  ],
  "turn": "white",
  "playerSides": {
    "white": "unassigned",
    "black": "unassigned",
    "red": "unassigned",
    "blue": "unassigned"
  }
}
StartingBoards.add_board :trio,{
  "name" => "trio",
  "height" => 24,
  "width" => 24,
  "walls" => [{"posx":"0","posy":"0"},
{"posx":"23","posy":"0"},
{"posx":"1","posy":"1"},
{"posx":"22","posy":"1"},
{"posx":"2","posy":"2"},
{"posx":"21","posy":"2"},
{"posx":"3","posy":"3"},
{"posx":"20","posy":"3"},
{"posx":"4","posy":"4"},
{"posx":"19","posy":"4"},
{"posx":"11","posy":"5"},
{"posx":"12","posy":"5"},
{"posx":"10","posy":"7"},
{"posx":"13","posy":"7"},
{"posx":"10","posy":"8"},
{"posx":"13","posy":"8"},
{"posx":"8","posy":"9"},
{"posx":"15","posy":"9"},
{"posx":"8","posy":"10"},
{"posx":"15","posy":"10"},
{"posx":"10","posy":"11"},
{"posx":"13","posy":"11"},
{"posx":"10","posy":"12"},
{"posx":"13","posy":"12"},
{"posx":"9","posy":"13"},
{"posx":"10","posy":"13"},
{"posx":"13","posy":"13"},
{"posx":"14","posy":"13"},
{"posx":"8","posy":"14"},
{"posx":"9","posy":"14"},
{"posx":"14","posy":"14"},
{"posx":"15","posy":"14"},
{"posx":"7","posy":"15"},
{"posx":"16","posy":"15"},
{"posx":"6","posy":"16"},
{"posx":"7","posy":"16"},
{"posx":"16","posy":"16"},
{"posx":"17","posy":"16"},
{"posx":"0","posy":"17"},
{"posx":"1","posy":"17"},
{"posx":"2","posy":"17"},
{"posx":"3","posy":"17"},
{"posx":"4","posy":"17"},
{"posx":"5","posy":"17"},
{"posx":"6","posy":"17"},
{"posx":"17","posy":"17"},
{"posx":"18","posy":"17"},
{"posx":"19","posy":"17"},
{"posx":"20","posy":"17"},
{"posx":"21","posy":"17"},
{"posx":"22","posy":"17"},
{"posx":"23","posy":"17"}

  ],
  "upgradeSquares" => [
  {"posx":"0","posy":"23"},
  {"posx":"1","posy":"23"},
  {"posx":"2","posy":"23"},
  {"posx":"3","posy":"23"},
  {"posx":"4","posy":"23"},
  {"posx":"5","posy":"23"},
  {"posx":"6","posy":"23"},
  {"posx":"7","posy":"23"},
  {"posx":"8","posy":"23"},
  {"posx":"9","posy":"23"},
  {"posx":"10","posy":"23"},
  {"posx":"11","posy":"23"},
  {"posx":"12","posy":"23"},
  {"posx":"13","posy":"23"},
  {"posx":"14","posy":"23"},
  {"posx":"15","posy":"23"},
  {"posx":"16","posy":"23"},
  {"posx":"17","posy":"23"},
  {"posx":"18","posy":"23"},
  {"posx":"19","posy":"23"},
  {"posx":"20","posy":"23"},
  {"posx":"21","posy":"23"},
  {"posx":"22","posy":"23"},
  {"posx":"23","posy":"23"}],
  "boardStack" => [[  {"posx":"8","posy":"0","type":"rook","side":"red"},
  {"posx":"9","posy":"0","type":"knight","side":"red"},
  {"posx":"10","posy":"0","type":"bishop","side":"red"},
  {"posx":"11","posy":"0","type":"queen","side":"red"},
  {"posx":"12","posy":"0","type":"king","side":"red"},
  {"posx":"13","posy":"0","type":"bishop","side":"red"},
  {"posx":"14","posy":"0","type":"knight","side":"red"},
  {"posx":"15","posy":"0","type":"rook","side":"red"},
  {"posx":"8","posy":"1","type":"pawn","side":"red"},
  {"posx":"9","posy":"1","type":"pawn","side":"red"},
  {"posx":"10","posy":"1","type":"pawn","side":"red"},
  {"posx":"11","posy":"1","type":"pawn","side":"red"},
  {"posx":"12","posy":"1","type":"pawn","side":"red"},
  {"posx":"13","posy":"1","type":"pawn","side":"red"},
  {"posx":"14","posy":"1","type":"pawn","side":"red"},
  {"posx":"15","posy":"1","type":"pawn","side":"red"},
  {"posx":"0","posy":"6","type":"rook","side":"black"},
  {"posx":"1","posy":"6","type":"pawn","side":"black"},
  {"posx":"22","posy":"6","type":"pawn","side":"white"},
  {"posx":"23","posy":"6","type":"rook","side":"white"},
  {"posx":"0","posy":"7","type":"knight","side":"black"},
  {"posx":"1","posy":"7","type":"pawn","side":"black"},
  {"posx":"22","posy":"7","type":"pawn","side":"white"},
  {"posx":"23","posy":"7","type":"knight","side":"white"},
  {"posx":"0","posy":"8","type":"bishop","side":"black"},
  {"posx":"1","posy":"8","type":"pawn","side":"black"},
  {"posx":"22","posy":"8","type":"pawn","side":"white"},
  {"posx":"23","posy":"8","type":"bishop","side":"white"},
  {"posx":"0","posy":"9","type":"king","side":"black"},
  {"posx":"1","posy":"9","type":"pawn","side":"black"},
  {"posx":"22","posy":"9","type":"pawn","side":"white"},
  {"posx":"23","posy":"9","type":"queen","side":"white"},
  {"posx":"0","posy":"10","type":"queen","side":"black"},
  {"posx":"1","posy":"10","type":"pawn","side":"black"},
  {"posx":"22","posy":"10","type":"pawn","side":"white"},
  {"posx":"23","posy":"10","type":"king","side":"white"},
  {"posx":"0","posy":"11","type":"bishop","side":"black"},
  {"posx":"1","posy":"11","type":"pawn","side":"black"},
  {"posx":"22","posy":"11","type":"pawn","side":"white"},
  {"posx":"23","posy":"11","type":"bishop","side":"white"},
  {"posx":"0","posy":"12","type":"knight","side":"black"},
  {"posx":"1","posy":"12","type":"pawn","side":"black"},  
  {"posx":"22","posy":"12","type":"pawn","side":"white"},
  {"posx":"23","posy":"12","type":"knight","side":"white"},
  {"posx":"0","posy":"13","type":"rook","side":"black"},
  {"posx":"1","posy":"13","type":"pawn","side":"black"},
  {"posx":"22","posy":"13","type":"pawn","side":"white"},
  {"posx":"23","posy":"13","type":"rook","side":"white"},
  ]],
  "turn" => "white",
  "playerSides" =>  {
    "white" => "unassigned",
    "black" => "unassigned",
    "red" => "unassigned"
  }
}

StartingBoards.add_board :pyramidOfDeath,{
  "name": "pyramidOfDeath",
  "height": 32,
  "width": 32,
  "walls": [
    {
      "posx": "0",
      "posy": "0"
    },
    {
      "posx": "15",
      "posy": "0"
    },
    {
      "posx": "30",
      "posy": "0"
    },
    {
      "posx": "31",
      "posy": "0"
    },
    {
      "posx": "0",
      "posy": "1"
    },
    {
      "posx": "1",
      "posy": "1"
    },
    {
      "posx": "15",
      "posy": "1"
    },
    {
      "posx": "16",
      "posy": "1"
    },
    {
      "posx": "29",
      "posy": "1"
    },
    {
      "posx": "30",
      "posy": "1"
    },
    {
      "posx": "1",
      "posy": "2"
    },
    {
      "posx": "2",
      "posy": "2"
    },
    {
      "posx": "16",
      "posy": "2"
    },
    {
      "posx": "28",
      "posy": "2"
    },
    {
      "posx": "29",
      "posy": "2"
    },
    {
      "posx": "2",
      "posy": "3"
    },
    {
      "posx": "3",
      "posy": "3"
    },
    {
      "posx": "16",
      "posy": "3"
    },
    {
      "posx": "27",
      "posy": "3"
    },
    {
      "posx": "28",
      "posy": "3"
    },
    {
      "posx": "3",
      "posy": "4"
    },
    {
      "posx": "4",
      "posy": "4"
    },
    {
      "posx": "15",
      "posy": "4"
    },
    {
      "posx": "16",
      "posy": "4"
    },
    {
      "posx": "26",
      "posy": "4"
    },
    {
      "posx": "27",
      "posy": "4"
    },
    {
      "posx": "4",
      "posy": "5"
    },
    {
      "posx": "5",
      "posy": "5"
    },
    {
      "posx": "15",
      "posy": "5"
    },
    {
      "posx": "25",
      "posy": "5"
    },
    {
      "posx": "26",
      "posy": "5"
    },
    {
      "posx": "5",
      "posy": "6"
    },
    {
      "posx": "6",
      "posy": "6"
    },
    {
      "posx": "15",
      "posy": "6"
    },
    {
      "posx": "24",
      "posy": "6"
    },
    {
      "posx": "25",
      "posy": "6"
    },
    {
      "posx": "6",
      "posy": "7"
    },
    {
      "posx": "7",
      "posy": "7"
    },
    {
      "posx": "15",
      "posy": "7"
    },
    {
      "posx": "16",
      "posy": "7"
    },
    {
      "posx": "23",
      "posy": "7"
    },
    {
      "posx": "24",
      "posy": "7"
    },
    {
      "posx": "7",
      "posy": "8"
    },
    {
      "posx": "8",
      "posy": "8"
    },
    {
      "posx": "16",
      "posy": "8"
    },
    {
      "posx": "22",
      "posy": "8"
    },
    {
      "posx": "23",
      "posy": "8"
    },
    {
      "posx": "8",
      "posy": "9"
    },
    {
      "posx": "9",
      "posy": "9"
    },
    {
      "posx": "16",
      "posy": "9"
    },
    {
      "posx": "22",
      "posy": "9"
    },
    {
      "posx": "15",
      "posy": "10"
    },
    {
      "posx": "16",
      "posy": "10"
    },
    {
      "posx": "1",
      "posy": "15"
    },
    {
      "posx": "2",
      "posy": "15"
    },
    {
      "posx": "3",
      "posy": "15"
    },
    {
      "posx": "4",
      "posy": "15"
    },
    {
      "posx": "7",
      "posy": "15"
    },
    {
      "posx": "8",
      "posy": "15"
    },
    {
      "posx": "9",
      "posy": "15"
    },
    {
      "posx": "10",
      "posy": "15"
    },
    {
      "posx": "21",
      "posy": "15"
    },
    {
      "posx": "24",
      "posy": "15"
    },
    {
      "posx": "25",
      "posy": "15"
    },
    {
      "posx": "26",
      "posy": "15"
    },
    {
      "posx": "27",
      "posy": "15"
    },
    {
      "posx": "30",
      "posy": "15"
    },
    {
      "posx": "31",
      "posy": "15"
    },
    {
      "posx": "0",
      "posy": "16"
    },
    {
      "posx": "1",
      "posy": "16"
    },
    {
      "posx": "4",
      "posy": "16"
    },
    {
      "posx": "5",
      "posy": "16"
    },
    {
      "posx": "6",
      "posy": "16"
    },
    {
      "posx": "7",
      "posy": "16"
    },
    {
      "posx": "10",
      "posy": "16"
    },
    {
      "posx": "21",
      "posy": "16"
    },
    {
      "posx": "22",
      "posy": "16"
    },
    {
      "posx": "23",
      "posy": "16"
    },
    {
      "posx": "24",
      "posy": "16"
    },
    {
      "posx": "27",
      "posy": "16"
    },
    {
      "posx": "28",
      "posy": "16"
    },
    {
      "posx": "29",
      "posy": "16"
    },
    {
      "posx": "30",
      "posy": "16"
    },
    {
      "posx": "15",
      "posy": "21"
    },
    {
      "posx": "16",
      "posy": "21"
    },
    {
      "posx": "9",
      "posy": "22"
    },
    {
      "posx": "15",
      "posy": "22"
    },
    {
      "posx": "22",
      "posy": "22"
    },
    {
      "posx": "23",
      "posy": "22"
    },
    {
      "posx": "8",
      "posy": "23"
    },
    {
      "posx": "9",
      "posy": "23"
    },
    {
      "posx": "15",
      "posy": "23"
    },
    {
      "posx": "23",
      "posy": "23"
    },
    {
      "posx": "24",
      "posy": "23"
    },
    {
      "posx": "7",
      "posy": "24"
    },
    {
      "posx": "8",
      "posy": "24"
    },
    {
      "posx": "15",
      "posy": "24"
    },
    {
      "posx": "16",
      "posy": "24"
    },
    {
      "posx": "24",
      "posy": "24"
    },
    {
      "posx": "25",
      "posy": "24"
    },
    {
      "posx": "6",
      "posy": "25"
    },
    {
      "posx": "7",
      "posy": "25"
    },
    {
      "posx": "16",
      "posy": "25"
    },
    {
      "posx": "25",
      "posy": "25"
    },
    {
      "posx": "26",
      "posy": "25"
    },
    {
      "posx": "5",
      "posy": "26"
    },
    {
      "posx": "6",
      "posy": "26"
    },
    {
      "posx": "16",
      "posy": "26"
    },
    {
      "posx": "26",
      "posy": "26"
    },
    {
      "posx": "27",
      "posy": "26"
    },
    {
      "posx": "4",
      "posy": "27"
    },
    {
      "posx": "5",
      "posy": "27"
    },
    {
      "posx": "15",
      "posy": "27"
    },
    {
      "posx": "16",
      "posy": "27"
    },
    {
      "posx": "27",
      "posy": "27"
    },
    {
      "posx": "28",
      "posy": "27"
    },
    {
      "posx": "3",
      "posy": "28"
    },
    {
      "posx": "4",
      "posy": "28"
    },
    {
      "posx": "15",
      "posy": "28"
    },
    {
      "posx": "28",
      "posy": "28"
    },
    {
      "posx": "29",
      "posy": "28"
    },
    {
      "posx": "2",
      "posy": "29"
    },
    {
      "posx": "3",
      "posy": "29"
    },
    {
      "posx": "15",
      "posy": "29"
    },
    {
      "posx": "29",
      "posy": "29"
    },
    {
      "posx": "30",
      "posy": "29"
    },
    {
      "posx": "1",
      "posy": "30"
    },
    {
      "posx": "2",
      "posy": "30"
    },
    {
      "posx": "15",
      "posy": "30"
    },
    {
      "posx": "16",
      "posy": "30"
    },
    {
      "posx": "30",
      "posy": "30"
    },
    {
      "posx": "31",
      "posy": "30"
    },
    {
      "posx": "0",
      "posy": "31"
    },
    {
      "posx": "1",
      "posy": "31"
    },
    {
      "posx": "16",
      "posy": "31"
    },
    {
      "posx": "31",
      "posy": "31"
    }
  ],
  "upgradeSquares": [
    {
      "posx": "16",
      "posy": "0"
    },
    {
      "posx": "17",
      "posy": "0"
    },
    {
      "posx": "18",
      "posy": "0"
    },
    {
      "posx": "19",
      "posy": "0"
    },
    {
      "posx": "20",
      "posy": "0"
    },
    {
      "posx": "21",
      "posy": "0"
    },
    {
      "posx": "22",
      "posy": "0"
    },
    {
      "posx": "23",
      "posy": "0"
    },
    {
      "posx": "24",
      "posy": "0"
    },
    {
      "posx": "25",
      "posy": "0"
    },
    {
      "posx": "26",
      "posy": "0"
    },
    {
      "posx": "27",
      "posy": "0"
    },
    {
      "posx": "28",
      "posy": "0"
    },
    {
      "posx": "29",
      "posy": "0"
    },
    {
      "posx": "0",
      "posy": "2"
    },
    {
      "posx": "0",
      "posy": "3"
    },
    {
      "posx": "0",
      "posy": "4"
    },
    {
      "posx": "0",
      "posy": "5"
    },
    {
      "posx": "0",
      "posy": "6"
    },
    {
      "posx": "0",
      "posy": "7"
    },
    {
      "posx": "0",
      "posy": "8"
    },
    {
      "posx": "0",
      "posy": "9"
    },
    {
      "posx": "0",
      "posy": "10"
    },
    {
      "posx": "0",
      "posy": "11"
    },
    {
      "posx": "0",
      "posy": "12"
    },
    {
      "posx": "0",
      "posy": "13"
    },
    {
      "posx": "0",
      "posy": "14"
    },
    {
      "posx": "0",
      "posy": "15"
    },
    {
      "posx": "31",
      "posy": "16"
    },
    {
      "posx": "31",
      "posy": "17"
    },
    {
      "posx": "31",
      "posy": "18"
    },
    {
      "posx": "31",
      "posy": "19"
    },
    {
      "posx": "31",
      "posy": "20"
    },
    {
      "posx": "31",
      "posy": "21"
    },
    {
      "posx": "31",
      "posy": "22"
    },
    {
      "posx": "31",
      "posy": "23"
    },
    {
      "posx": "31",
      "posy": "24"
    },
    {
      "posx": "31",
      "posy": "25"
    },
    {
      "posx": "31",
      "posy": "26"
    },
    {
      "posx": "31",
      "posy": "27"
    },
    {
      "posx": "31",
      "posy": "28"
    },
    {
      "posx": "31",
      "posy": "29"
    },
    {
      "posx": "2",
      "posy": "31"
    },
    {
      "posx": "3",
      "posy": "31"
    },
    {
      "posx": "4",
      "posy": "31"
    },
    {
      "posx": "5",
      "posy": "31"
    },
    {
      "posx": "6",
      "posy": "31"
    },
    {
      "posx": "7",
      "posy": "31"
    },
    {
      "posx": "8",
      "posy": "31"
    },
    {
      "posx": "9",
      "posy": "31"
    },
    {
      "posx": "10",
      "posy": "31"
    },
    {
      "posx": "11",
      "posy": "31"
    },
    {
      "posx": "12",
      "posy": "31"
    },
    {
      "posx": "13",
      "posy": "31"
    },
    {
      "posx": "14",
      "posy": "31"
    },
    {
      "posx": "15",
      "posy": "31"
    }
  ],
  "boardStack": [
    [
      {
        "posx": "5",
        "posy": "0",
        "type": "rook",
        "side": "purple"
      },
      {
        "posx": "6",
        "posy": "0",
        "type": "knight",
        "side": "purple"
      },
      {
        "posx": "7",
        "posy": "0",
        "type": "bishop",
        "side": "purple"
      },
      {
        "posx": "8",
        "posy": "0",
        "type": "queen",
        "side": "purple"
      },
      {
        "posx": "9",
        "posy": "0",
        "type": "king",
        "side": "purple"
      },
      {
        "posx": "10",
        "posy": "0",
        "type": "bishop",
        "side": "purple"
      },
      {
        "posx": "11",
        "posy": "0",
        "type": "knight",
        "side": "purple"
      },
      {
        "posx": "12",
        "posy": "0",
        "type": "rook",
        "side": "purple"
      },
      {
        "posx": "5",
        "posy": "1",
        "type": "pawn",
        "side": "purple"
      },
      {
        "posx": "6",
        "posy": "1",
        "type": "pawn",
        "side": "purple"
      },
      {
        "posx": "7",
        "posy": "1",
        "type": "pawn",
        "side": "purple"
      },
      {
        "posx": "8",
        "posy": "1",
        "type": "pawn",
        "side": "purple"
      },
      {
        "posx": "9",
        "posy": "1",
        "type": "pawn",
        "side": "purple"
      },
      {
        "posx": "10",
        "posy": "1",
        "type": "pawn",
        "side": "purple"
      },
      {
        "posx": "11",
        "posy": "1",
        "type": "pawn",
        "side": "purple"
      },
      {
        "posx": "12",
        "posy": "1",
        "type": "pawn",
        "side": "purple"
      },
      {
        "posx": "30",
        "posy": "5",
        "type": "pawn",
        "side": "silver"
      },
      {
        "posx": "31",
        "posy": "5",
        "type": "rook",
        "side": "silver"
      },
      {
        "posx": "30",
        "posy": "6",
        "type": "pawn",
        "side": "silver"
      },
      {
        "posx": "31",
        "posy": "6",
        "type": "knight",
        "side": "silver"
      },
      {
        "posx": "30",
        "posy": "7",
        "type": "pawn",
        "side": "silver"
      },
      {
        "posx": "31",
        "posy": "7",
        "type": "bishop",
        "side": "silver"
      },
      {
        "posx": "30",
        "posy": "8",
        "type": "pawn",
        "side": "silver"
      },
      {
        "posx": "31",
        "posy": "8",
        "type": "queen",
        "side": "silver"
      },
      {
        "posx": "30",
        "posy": "9",
        "type": "pawn",
        "side": "silver"
      },
      {
        "posx": "31",
        "posy": "9",
        "type": "king",
        "side": "silver"
      },
      {
        "posx": "30",
        "posy": "10",
        "type": "pawn",
        "side": "silver"
      },
      {
        "posx": "31",
        "posy": "10",
        "type": "bishop",
        "side": "silver"
      },
      {
        "posx": "30",
        "posy": "11",
        "type": "pawn",
        "side": "silver"
      },
      {
        "posx": "31",
        "posy": "11",
        "type": "knight",
        "side": "silver"
      },
      {
        "posx": "30",
        "posy": "12",
        "type": "pawn",
        "side": "silver"
      },
      {
        "posx": "31",
        "posy": "12",
        "type": "rook",
        "side": "silver"
      },
      {
        "posx": "0",
        "posy": "19",
        "type": "rook",
        "side": "gold"
      },
      {
        "posx": "1",
        "posy": "19",
        "type": "pawn",
        "side": "gold"
      },
      {
        "posx": "0",
        "posy": "20",
        "type": "knight",
        "side": "gold"
      },
      {
        "posx": "1",
        "posy": "20",
        "type": "pawn",
        "side": "gold"
      },
      {
        "posx": "0",
        "posy": "21",
        "type": "bishop",
        "side": "gold"
      },
      {
        "posx": "1",
        "posy": "21",
        "type": "pawn",
        "side": "gold"
      },
      {
        "posx": "0",
        "posy": "22",
        "type": "king",
        "side": "gold"
      },
      {
        "posx": "1",
        "posy": "22",
        "type": "pawn",
        "side": "gold"
      },
      {
        "posx": "0",
        "posy": "23",
        "type": "queen",
        "side": "gold"
      },
      {
        "posx": "1",
        "posy": "23",
        "type": "pawn",
        "side": "gold"
      },
      {
        "posx": "0",
        "posy": "24",
        "type": "bishop",
        "side": "gold"
      },
      {
        "posx": "1",
        "posy": "24",
        "type": "pawn",
        "side": "gold"
      },
      {
        "posx": "0",
        "posy": "25",
        "type": "knight",
        "side": "gold"
      },
      {
        "posx": "1",
        "posy": "25",
        "type": "pawn",
        "side": "gold"
      },
      {
        "posx": "0",
        "posy": "26",
        "type": "rook",
        "side": "gold"
      },
      {
        "posx": "1",
        "posy": "26",
        "type": "pawn",
        "side": "gold"
      },
      {
        "posx": "19",
        "posy": "30",
        "type": "pawn",
        "side": "green"
      },
      {
        "posx": "20",
        "posy": "30",
        "type": "pawn",
        "side": "green"
      },
      {
        "posx": "21",
        "posy": "30",
        "type": "pawn",
        "side": "green"
      },
      {
        "posx": "22",
        "posy": "30",
        "type": "pawn",
        "side": "green"
      },
      {
        "posx": "23",
        "posy": "30",
        "type": "pawn",
        "side": "green"
      },
      {
        "posx": "24",
        "posy": "30",
        "type": "pawn",
        "side": "green"
      },
      {
        "posx": "25",
        "posy": "30",
        "type": "pawn",
        "side": "green"
      },
      {
        "posx": "26",
        "posy": "30",
        "type": "pawn",
        "side": "green"
      },
      {
        "posx": "19",
        "posy": "31",
        "type": "rook",
        "side": "green"
      },
      {
        "posx": "20",
        "posy": "31",
        "type": "knight",
        "side": "green"
      },
      {
        "posx": "21",
        "posy": "31",
        "type": "bishop",
        "side": "green"
      },
      {
        "posx": "22",
        "posy": "31",
        "type": "king",
        "side": "green"
      },
      {
        "posx": "23",
        "posy": "31",
        "type": "queen",
        "side": "green"
      },
      {
        "posx": "24",
        "posy": "31",
        "type": "bishop",
        "side": "green"
      },
      {
        "posx": "25",
        "posy": "31",
        "type": "knight",
        "side": "green"
      },
      {
        "posx": "26",
        "posy": "31",
        "type": "rook",
        "side": "green"
      }
    ]
  ],
  "turn": "gold",
  "playerSides": {
    "gold": "unassigned",
    "silver": "unassigned",
    "purple": "unassigned",
    "green": "unassigned",
  }
}

StartingBoards.add_board :eyeOfTheStorm,{
  "name": "Eye of the Storm",
  "height": 11,
  "width": 17,
  "walls": [
    {
      "posx": "5",
      "posy": "0"
    },
    {
      "posx": "11",
      "posy": "0"
    },
    {
      "posx": "5",
      "posy": "1"
    },
    {
      "posx": "11",
      "posy": "1"
    },
    {
      "posx": "4",
      "posy": "2"
    },
    {
      "posx": "7",
      "posy": "2"
    },
    {
      "posx": "9",
      "posy": "2"
    },
    {
      "posx": "12",
      "posy": "2"
    },
    {
      "posx": "7",
      "posy": "3"
    },
    {
      "posx": "9",
      "posy": "3"
    },
    {
      "posx": "0",
      "posy": "4"
    },
    {
      "posx": "2",
      "posy": "4"
    },
    {
      "posx": "6",
      "posy": "4"
    },
    {
      "posx": "10",
      "posy": "4"
    },
    {
      "posx": "14",
      "posy": "4"
    },
    {
      "posx": "16",
      "posy": "4"
    },
    {
      "posx": "0",
      "posy": "5"
    },
    {
      "posx": "1",
      "posy": "5"
    },
    {
      "posx": "6",
      "posy": "5"
    },
    {
      "posx": "10",
      "posy": "5"
    },
    {
      "posx": "15",
      "posy": "5"
    },
    {
      "posx": "16",
      "posy": "5"
    },
    {
      "posx": "0",
      "posy": "6"
    },
    {
      "posx": "2",
      "posy": "6"
    },
    {
      "posx": "6",
      "posy": "6"
    },
    {
      "posx": "10",
      "posy": "6"
    },
    {
      "posx": "14",
      "posy": "6"
    },
    {
      "posx": "16",
      "posy": "6"
    },
    {
      "posx": "7",
      "posy": "7"
    },
    {
      "posx": "9",
      "posy": "7"
    },
    {
      "posx": "4",
      "posy": "8"
    },
    {
      "posx": "7",
      "posy": "8"
    },
    {
      "posx": "9",
      "posy": "8"
    },
    {
      "posx": "12",
      "posy": "8"
    },
    {
      "posx": "5",
      "posy": "9"
    },
    {
      "posx": "11",
      "posy": "9"
    },
    {
      "posx": "5",
      "posy": "10"
    },
    {
      "posx": "11",
      "posy": "10"
    }
  ],
  "upgradeSquares": [
    {
      "posx": "7",
      "posy": "5"
    },
    {
      "posx": "8",
      "posy": "5"
    },
    {
      "posx": "9",
      "posy": "5"
    }
  ],
  "boardStack": [
    [
      {
        "posx": "0",
        "posy": "0",
        "type": "king",
        "side": "black"
      },
      {
        "posx": "1",
        "posy": "0",
        "type": "rook",
        "side": "black"
      },
      {
        "posx": "3",
        "posy": "0",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "13",
        "posy": "0",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "15",
        "posy": "0",
        "type": "rook",
        "side": "red"
      },
      {
        "posx": "16",
        "posy": "0",
        "type": "king",
        "side": "red"
      },
      {
        "posx": "0",
        "posy": "1",
        "type": "queen",
        "side": "black"
      },
      {
        "posx": "1",
        "posy": "1",
        "type": "rook",
        "side": "black"
      },
      {
        "posx": "2",
        "posy": "1",
        "type": "bishop",
        "side": "black"
      },
      {
        "posx": "3",
        "posy": "1",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "4",
        "posy": "1",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "12",
        "posy": "1",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "13",
        "posy": "1",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "14",
        "posy": "1",
        "type": "bishop",
        "side": "red"
      },
      {
        "posx": "15",
        "posy": "1",
        "type": "rook",
        "side": "red"
      },
      {
        "posx": "16",
        "posy": "1",
        "type": "queen",
        "side": "red"
      },
      {
        "posx": "0",
        "posy": "2",
        "type": "knight",
        "side": "black"
      },
      {
        "posx": "1",
        "posy": "2",
        "type": "knight",
        "side": "black"
      },
      {
        "posx": "2",
        "posy": "2",
        "type": "bishop",
        "side": "black"
      },
      {
        "posx": "3",
        "posy": "2",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "13",
        "posy": "2",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "14",
        "posy": "2",
        "type": "bishop",
        "side": "red"
      },
      {
        "posx": "15",
        "posy": "2",
        "type": "knight",
        "side": "red"
      },
      {
        "posx": "16",
        "posy": "2",
        "type": "knight",
        "side": "red"
      },
      {
        "posx": "0",
        "posy": "3",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "1",
        "posy": "3",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "2",
        "posy": "3",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "14",
        "posy": "3",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "15",
        "posy": "3",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "16",
        "posy": "3",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "1",
        "posy": "4",
        "type": "pawn",
        "side": "black"
      },
      {
        "posx": "15",
        "posy": "4",
        "type": "pawn",
        "side": "red"
      },
      {
        "posx": "1",
        "posy": "6",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "15",
        "posy": "6",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "0",
        "posy": "7",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "1",
        "posy": "7",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "2",
        "posy": "7",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "14",
        "posy": "7",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "15",
        "posy": "7",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "16",
        "posy": "7",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "0",
        "posy": "8",
        "type": "knight",
        "side": "blue"
      },
      {
        "posx": "1",
        "posy": "8",
        "type": "knight",
        "side": "blue"
      },
      {
        "posx": "2",
        "posy": "8",
        "type": "bishop",
        "side": "blue"
      },
      {
        "posx": "3",
        "posy": "8",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "13",
        "posy": "8",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "14",
        "posy": "8",
        "type": "bishop",
        "side": "white"
      },
      {
        "posx": "15",
        "posy": "8",
        "type": "knight",
        "side": "white"
      },
      {
        "posx": "16",
        "posy": "8",
        "type": "knight",
        "side": "white"
      },
      {
        "posx": "0",
        "posy": "9",
        "type": "queen",
        "side": "blue"
      },
      {
        "posx": "1",
        "posy": "9",
        "type": "rook",
        "side": "blue"
      },
      {
        "posx": "2",
        "posy": "9",
        "type": "bishop",
        "side": "blue"
      },
      {
        "posx": "3",
        "posy": "9",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "4",
        "posy": "9",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "12",
        "posy": "9",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "13",
        "posy": "9",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "14",
        "posy": "9",
        "type": "bishop",
        "side": "white"
      },
      {
        "posx": "15",
        "posy": "9",
        "type": "rook",
        "side": "white"
      },
      {
        "posx": "16",
        "posy": "9",
        "type": "queen",
        "side": "white"
      },
      {
        "posx": "0",
        "posy": "10",
        "type": "king",
        "side": "blue"
      },
      {
        "posx": "1",
        "posy": "10",
        "type": "rook",
        "side": "blue"
      },
      {
        "posx": "3",
        "posy": "10",
        "type": "pawn",
        "side": "blue"
      },
      {
        "posx": "13",
        "posy": "10",
        "type": "pawn",
        "side": "white"
      },
      {
        "posx": "15",
        "posy": "10",
        "type": "rook",
        "side": "white"
      },
      {
        "posx": "16",
        "posy": "10",
        "type": "king",
        "side": "white"
      }
    ]
  ],
  "turn": "white",
  "playerSides": {
    "white": "unassigned",
    "black": "unassigned",
    "red": "unassigned",
    "blue": "unassigned"
  }
}

StartingBoards.add_board :two_on_one, {
  "name" => "two on one",
  "height" => 15,
  "width" => 11,
  "walls" => [
    { "posx" => "4", "posy" => "2" },
    { "posx" => "6", "posy" => "2" },
    { "posx" => "3", "posy" => "3" },
    { "posx" => "7", "posy" => "3" },
    { "posx" => "4", "posy" => "4" },
    { "posx" => "6", "posy" => "4" },
    { "posx" => "3", "posy" => "5" },
    { "posx" => "7", "posy" => "5" },
    { "posx" => "4", "posy" => "6" },
    { "posx" => "6", "posy" => "6" },
    { "posx" => "3", "posy" => "7" },
    { "posx" => "7", "posy" => "7" },
    { "posx" => "4", "posy" => "8" },
    { "posx" => "6", "posy" => "8" }
  ],
  "upgradeSquares" => [
    { "posx" => "5", "posy" => "3" },
    { "posx" => "5", "posy" => "4" },
    { "posx" => "5", "posy" => "5" },
    { "posx" => "5", "posy" => "6" },
    { "posx" => "5", "posy" => "7" },
    { "posx" => "5", "posy" => "8" },
    { "posx" => "5", "posy" => "9" }
  ],
  "boardStack" => [
    [
      { "posx" => "0", "posy" => "0", "type" => "rook", "side" => "white" },
      { "posx" => "1", "posy" => "0", "type" => "pawn", "side" => "white" },
      { "posx" => "9", "posy" => "0", "type" => "pawn", "side" => "black" },
      { "posx" => "10", "posy" => "0", "type" => "rook", "side" => "black" },
      { "posx" => "0", "posy" => "1", "type" => "knight", "side" => "white" },
      { "posx" => "1", "posy" => "1", "type" => "pawn", "side" => "white" },
      { "posx" => "9", "posy" => "1", "type" => "pawn", "side" => "black" },
      { "posx" => "10", "posy" => "1", "type" => "knight", "side" => "black" },
      { "posx" => "0", "posy" => "2", "type" => "bishop", "side" => "white" },
      { "posx" => "1", "posy" => "2", "type" => "pawn", "side" => "white" },
      { "posx" => "9", "posy" => "2", "type" => "pawn", "side" => "black" },
      { "posx" => "10", "posy" => "2", "type" => "bishop", "side" => "black" },
      { "posx" => "0", "posy" => "3", "type" => "queen", "side" => "white" },
      { "posx" => "1", "posy" => "3", "type" => "pawn", "side" => "white" },
      { "posx" => "9", "posy" => "3", "type" => "pawn", "side" => "black" },
      { "posx" => "10", "posy" => "3", "type" => "queen", "side" => "black" },
      { "posx" => "0", "posy" => "4", "type" => "king", "side" => "white" },
      { "posx" => "1", "posy" => "4", "type" => "pawn", "side" => "white" },
      { "posx" => "9", "posy" => "4", "type" => "pawn", "side" => "black" },
      { "posx" => "10", "posy" => "4", "type" => "king", "side" => "black" },
      { "posx" => "0", "posy" => "5", "type" => "bishop", "side" => "white" },
      { "posx" => "1", "posy" => "5", "type" => "pawn", "side" => "white" },
      { "posx" => "9", "posy" => "5", "type" => "pawn", "side" => "black" },
      { "posx" => "10", "posy" => "5", "type" => "bishop", "side" => "black" },
      { "posx" => "0", "posy" => "6", "type" => "knight", "side" => "white" },
      { "posx" => "1", "posy" => "6", "type" => "pawn", "side" => "white" },
      { "posx" => "9", "posy" => "6", "type" => "pawn", "side" => "black" },
      { "posx" => "10", "posy" => "6", "type" => "knight", "side" => "black" },
      { "posx" => "0", "posy" => "7", "type" => "rook", "side" => "white" },
      { "posx" => "1", "posy" => "7", "type" => "pawn", "side" => "white" },
      { "posx" => "9", "posy" => "7", "type" => "pawn", "side" => "black" },
      { "posx" => "10", "posy" => "7", "type" => "rook", "side" => "black" },
      { "posx" => "0", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "1", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "2", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "3", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "4", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "5", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "6", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "7", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "8", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "9", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "10", "posy" => "13", "type" => "pawn", "side" => "red" },
      { "posx" => "0", "posy" => "14", "type" => "pawn", "side" => "red" },
      { "posx" => "1", "posy" => "14", "type" => "rook", "side" => "red" },
      { "posx" => "2", "posy" => "14", "type" => "knight", "side" => "red" },
      { "posx" => "3", "posy" => "14", "type" => "bishop", "side" => "red" },
      { "posx" => "4", "posy" => "14", "type" => "queen", "side" => "red" },
      { "posx" => "5", "posy" => "14", "type" => "king", "side" => "red" },
      { "posx" => "6", "posy" => "14", "type" => "queen", "side" => "red" },
      { "posx" => "7", "posy" => "14", "type" => "bishop", "side" => "red" },
      { "posx" => "8", "posy" => "14", "type" => "knight", "side" => "red" },
      { "posx" => "9", "posy" => "14", "type" => "rook", "side" => "red" },
      { "posx" => "10", "posy" => "14", "type" => "pawn", "side" => "red" }
    ]
  ],
  "turn" => "white",
  "playerSides" => {
    "white" => "unassigned",
    "black" => "unassigned",
    "red" => "unassigned"
  }
}