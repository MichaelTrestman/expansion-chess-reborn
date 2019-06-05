
RSpec.describe GameParser do
  GAME_IDs = [
    '-LgbScO66ZzR-L4x66qN',
    '-LgbSeNghV8O84LSLxO5',
    '-LgbSfhqfBoieaLqYbCe'
  ]
  it "parses game data correctly" do

    game_id = GAME_IDs.first
    game_path = "https://xchess-a3561.firebaseio.com/test/games/#{GAME_IDs.first}.json"
    response = HTTParty.get(game_path)
    expect(response.ok?).to be true
    bod = response.body
    expect{JSON.parse(bod)}.to_not raise_error

    game_data = GameParser.parse_game_state(bod)

    expect(game_data.walls).to be_an Array
    expect(game_data.walls.first).to be_a Wall

    expect(game_data.upgradeSquares).to be_an Array
    expect(game_data.upgradeSquares.first).to be_a UpgradeSquare

    expect(game_data.current_piece_placement).to be_an Array
    expect(game_data.current_piece_placement.first).to be_a Piece
    expect(['black', 'white', 'red', 'blue'].include? game_data.turn).to be true
  end



  def firebase_client_data
    {
      url: "https://xchess-a3561.firebaseio.com",
      private_key_json: File.open(ENV['PATH_TO_FB_KEY_JSON']).read
    }
  end
  def firebase_client
    @firebase ||= Firebase::Client.new(firebase_client_data[:url], firebase_client_data[:private_key_json])
  end

  def starting_board
    StartingBoards.get_board(params[:starting_board].to_sym).deep_symbolize_keys
  end
end
