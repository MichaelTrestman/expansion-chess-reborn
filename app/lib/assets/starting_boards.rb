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
