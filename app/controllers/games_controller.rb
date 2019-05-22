class GamesController < ApplicationController

  def index
    config.firebase_client_data = {
    url: "https://xchess-a3561.firebaseio.com",
    private_key_json: File.open("/Users/michaeltrestman/keys/xchess-a3561-firebase-adminsdk-2hn8l-2e1b6600b5.json").read
  }
    firebase = Firebase::Client.new(config.firebase_client_data[:url], config.firebase_client_data[:private_key_json])
    puts "firebase.get('games')"
    @games = firebase.get('games').body
  end
  def calculate_moves (board, chosen_piece)

  end
  def show
  end
end
