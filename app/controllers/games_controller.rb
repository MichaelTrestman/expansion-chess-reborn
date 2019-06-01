class GamesController < ApplicationController

  def new
    @rails_env = ENV['RAILS_ENV']
    @board_names = ::StartingBoards.boards.keys
  end

  def create

    response = firebase_client.push("#{ENV['RAILS_ENV']}/games", starting_board)
    id = response.body["name"]
    redirect_to :action => "show", :id => id
  end


  def index
    @games = firebase_client.get("#{ENV['RAILS_ENV']}games").body
  end

  def show
    @game_path = "#{ENV['RAILS_ENV']}/games/#{params[:id]}"
    game_data = firebase_client.get(@game_path).body
    raise "Missing Game" if game_data.nil?
    board_stack = game_data["boardStack"]
    @current_board_state = board_stack.pop
    @board_height = game_data["height"]
    @board_width = game_data["width"]
  end


  private

  def firebase_client

    firebase_client_data = {
      url: "https://xchess-a3561.firebaseio.com",
      private_key_json: File.open("/Users/michaeltrestman/keys/xchess-a3561-firebase-adminsdk-2hn8l-2e1b6600b5.json").read
    }
    @firebase = Firebase::Client.new(firebase_client_data[:url], firebase_client_data[:private_key_json])
  end

  def starting_board
    StartingBoards.get_board(params[:starting_board].to_sym)
  end


end
