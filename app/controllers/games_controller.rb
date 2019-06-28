class GamesController < ApplicationController

  include GameData
  before_action :authenticate_user

  def authenticate_user

    redirect_to login_path if session[:user_id].nil?

  end

  def new
    @rails_env = ENV['RAILS_ENV']
    @board_names = ::StartingBoards.boards.keys
  end

  def create
    board = starting_board
    board[:lastUpdate] = Time.now
    board[:playerSides][:black] = params[:black_player]
    board[:playerSides][:white] = params[:white_player]
    id = games_db.insert_one(board).inserted_ids.first.to_s
    redirect_to :action => "show", :id => id
  end

  def mongo_data
    id = params['game_id']

    game_data = games_db.find({_id: BSON::ObjectId(id)}).first
    render :json => game_data
  end
  def index
    @games = games_db.find({
      :$or => [
        {
          'playerSides.black' => session[:user_email]
        },
        {
          'playerSides.white' => session[:user_email]
        }
      ]
    }).to_a
  end

  def show
    @id = params[:id]
    game_data = games_db.find({_id: BSON::ObjectId(@id)}).first
    @game_path = @id
    raise "Missing Game" if game_data.nil?
    board_stack = game_data[:boardStack]
    @current_board_state = board_stack.last
    @board_height = game_data[:height]
    @board_width = game_data[:width]
    @playerSides = game_data[:playerSides]
  end

  private

end
