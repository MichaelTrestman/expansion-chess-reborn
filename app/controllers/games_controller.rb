class GamesController < ApplicationController

  include GameData
  before_action :authenticate_user!
  def new
    @rails_env = ENV['RAILS_ENV']
    @board_names = ::StartingBoards.boards.keys
  end

  def create
    board = starting_board
    board[:playerSides].each_key{ |k| board[:playerSides][k] = current_user.email}
    board[:lastUpdate] = Time.now
    id = games_db.insert_one(board).inserted_ids.first.to_s
    redirect_to :action => "show", :id => id
  end

  def mongo_data
    id = params['game_id']

    game_data = games_db.find({_id: BSON::ObjectId(id)}).first
    render :json => game_data
  end
  def index
    @games = games_for_user current_user
  end

  def show
    @id = params[:id]
    game_data = games_db.find({_id: BSON::ObjectId(@id)}).first

    raise "Missing Game" if game_data.nil?
    board_stack = game_data[:boardStack]
    @current_board_state = board_stack.last
    @board_height = game_data[:height]
    @board_width = game_data[:width]
  end

  private

end
