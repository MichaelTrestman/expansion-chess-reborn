module GameData
  extend ActiveSupport::Concern

  def games_db
    @games_db ||= Mongo::Client.new([ 'mongodb://heroku_v95f0q1m:tjkh0h6ln8qn26vqiavli9qikr@ds253017.mlab.com:53017/heroku_v95f0q1m' ], :database => ENV.fetch('RAILS_ENV')).database[:games]
  end

  def starting_board
    StartingBoards.get_board(params[:starting_board].to_sym).deep_symbolize_keys
  end
end