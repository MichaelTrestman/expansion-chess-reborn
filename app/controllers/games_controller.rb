class GamesController < ApplicationController
  require 'net/http'
  require 'uri'

  def new
    @rails_env = ENV['RAILS_ENV']
    @board_names = ::StartingBoards.boards.keys
  end

  def create
    board = starting_board
    board[:lastUpdate] = Time.now
    response = firebase_client.push("#{ENV['RAILS_ENV']}/games", board)
    id = response.body["name"]
    redirect_to :action => "show", :id => id
  end


  def index
    @games = firebase_client.get("#{ENV['RAILS_ENV']}/games").body
  end


  def show
    @game_path = "#{ENV['RAILS_ENV']}/games/#{params[:id]}"
    url = URI.parse("#{firebase_client_data[:url]}/#{@game_path}")
    response = Net::HTTP.get_response(uri)
    game_data = GameParser.parse_game_state(response.body)
  end
  def xshow
    @game_path = "#{ENV['RAILS_ENV']}/games/#{params[:id]}"
    game_data = firebase_client.get(@game_path).body.deep_symbolize_keys
    raise "Missing Game" if game_data.nil?
    board_stack = game_data[:boardStack]
    @current_board_state = board_stack.last
    @board_height = game_data[:height]
    @board_width = game_data[:width]
  end

  private

  def firebase_client_data
    {
      url: "https://xchess-a3561.firebaseio.com",
      private_key_json: File.open(ENV['PATH_TO_FB_KEY_JSON']).read
    }
  end
  def firebase_client
    @firebase = Firebase::Client.new(firebase_client_data[:url], firebase_client_data[:private_key_json])
  end

  def starting_board
    StartingBoards.get_board(params[:starting_board].to_sym).deep_symbolize_keys
  end
end
