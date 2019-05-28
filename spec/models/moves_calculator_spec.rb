require 'rails_helper'
require_relative '../../lib/assets/starting_boards'
RSpec.describe MovesCalculator do
  let(:moves_calculator) do
      MovesCalculator.new({
        starting_board: starting_board,
        current_piece_placement: current_piece_placement,
        focal_piece: focal_piece
      })
  end
  let(:focal_piece) { nil }
  let(:current_piece_placement){ nil }

  describe "#space_is_off_board" do
    let(:starting_board) { {"width" => 3, "height" => 3} }

    context 'when the space is on the board' do

      let(:candidate_space) { {
        :posx => 1, :posy => 0
      } }
      it "says the space is not off the board" do
        expect(moves_calculator.space_is_off_board(candidate_space)).to eq false
      end
      let(:candidate_space) { {
        :posx => 1, :posy => 2
      } }
      it "says the space is not off the board" do
        expect(moves_calculator.space_is_off_board(candidate_space)).to eq false
      end
    end
    context 'when the space is off the board' do
      let(:candidate_space) { {
        :posx => -1, :posy => 0
      } }
      it "says the space is off the board" do
        expect(moves_calculator.space_is_off_board(candidate_space)).to eq true
      end
      let(:candidate_space) { {
        :posx => 1, :posy => 99
      } }
      it "says the space is off the board" do
        expect(moves_calculator.space_is_off_board(candidate_space)).to eq true
      end
    end
  end

  describe "#space_available" do
    let(:starting_board) { {
      "starting board name" => 'test example',
      "height" => 3,
      "width" => 3,
      "walls" => [],
      "upgradeSquares" => [],
      "boardStack" => [
      ],
      "playerSides" =>  {
        "red" => "unassigned",
        "blue" => "unassigned"
      },
      "turn" => "red"
    } }
    let(:current_piece_placement){[
      {:posx => 1,:posy => 0,:type => "rook",:side => "red"},
      {:posx => 0,:posy => 1,:type => "rook",:side => "blue"}
    ]}
    let(:focal_piece){
      {:posx => 1,:posy => 0,:type => "rook",:side => "red"}
    }
    context 'when the candidate space is off the board' do
      let(:candidate_space) { {posx: 99, posy: 0} }
      it "returns movable false and killable false" do
        expect(moves_calculator.space_available(candidate_space)).to eq({
            movable: false,
            killable: false
          })
      end
    end
    context 'when the candidate space contains a friendly piece' do
      let(:focal_piece){
        {:posx => 1,:posy => 0,:type => "rook",:side => "red"}
      }
      let(:candidate_space) { {posx: 1, posy: 1} }
      let(:current_piece_placement){[
      {:posx => 1,:posy => 0,:type => "rook",:side => "red"},
      {:posx => 1,:posy => 1,:type => "rook",:side => "red"}
    ]}
      it "returns movable false and killable false" do
        expect(moves_calculator.space_available(candidate_space)).to eq({
            movable: false,
            killable: false
          })
      end
    end
    context 'when the candidate space contains an enemy piece' do
      let(:candidate_space) { {posx: 1, posy: 1} }
      let(:current_piece_placement){[
      { :posx => 1, :posy => 0, :type => "rook", :side => "blue"},
      { :posx => 1, :posy => 1, :type => "rook", :side => "blue"}
    ]}
      it "returns movable false and killable false" do
        expect(moves_calculator.space_available(candidate_space)).to eq({
            movable: true,
            killable: true
          })
      end
    end

  end





    ['pawn', 'knight', 'bishop', 'rook', 'queen', 'king'].each do |type|
      let(:focal_piece) { {
        :posx => 0,
        :posy => 0,
        :type => type,
        :side => "red"
      } }
      let(:starting_board) { StartingBoards["first"] }
      let(:current_piece_placement){[
        {
          :posx => 0,
          :posy => 0,
          :type => type,
          :side => "red"
        }
      ]}
      it "returns the set of valid moves for #{type}" do
        expect do
          puts moves_calculator.calculate_moves
        end.to_not raise_error
      end
    end

end