# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


todo:

games controller:

game show is for playing a game, you just load it and it updates whenever firebase changes the board


index show games involving logged in user

update (game id, board, move)
check to see if current board state of game(id) is the submitted board, and if it allows the move, if so, update the board state and add it to the board state stack

moves controller:

get move from board state and piece selection, doesn't touch firebase, just returns the set of valid moves for that piece computed from the board state. front end will use this when board

