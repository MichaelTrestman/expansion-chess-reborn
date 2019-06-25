module GameData
  extend ActiveSupport::Concern

  def games_db
    @games_db ||= Mongo::Client.new([ 'xchess-mongo-db:27017' ], :database => 'dev').database[:games]
  end

  def starting_board
    StartingBoards.get_board(params[:starting_board].to_sym).deep_symbolize_keys
  end
end