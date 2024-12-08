# config/initializers/mongo.rb

require 'mongo'

module MongoDBX
  def self.client
    @client ||= Mongo::Client.new(
      ['xchess-mongo-db:27017'],
      database: 'dev',
      pool_size: 10,           # Adjust based on your concurrency needs
      max_pool_size: 50,       # Prevents excessive connections
      wait_queue_timeout: 5    # Seconds to wait for a connection
    )
  end

  def self.games_db
    @games_db ||= client[:games]
  end
end
