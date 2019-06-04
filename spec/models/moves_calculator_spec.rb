require 'rails_helper'

RSpec.describe MovesCalculator do
  let(:moves_calculator) do
      MovesCalculator.new({
        starting_board: starting_board,
        current_piece_placement: current_piece_placement,
        focal_piece: focal_piece,
        current_turn: current_turn
      })
  end
  let(:current_turn) {'red'}
  let(:focal_piece) { nil }
  let(:current_piece_placement){ [] }
  let(:starting_board) {
    {
      :width => 3, :height => 3,
      :boardStack => [],
      :walls => [],
      :upgradeSquares => []
    }
  }

  describe "#move_is_valid?" do
    let(:focal_piece){
      {
        posx: 1,
        posy: 1,
        type: 'king',
        side: 'red'
      }
    }
    let(:current_piece_placement) {[
      {
        posx: 1,
        posy: 1,
        type: 'king',
        side: 'red'
      }
    ]}
    let(:proposed_move){
      {
        posx: 2,
        posy: 2,
        killed_piece: nil
      }
    }
    context 'if the proposed move is valid' do
      context 'if the space is empty' do
        it "returns true" do
          expect(moves_calculator.move_is_valid?(proposed_move)).to eq true
        end
      end
      context 'if the space contains an enemy' do
        let(:proposed_move) {
          {
            :killed_piece=>{:side=>"blue", :type=>"queen"},
            posx: 2,
            posy: 2
          }
        }
        let(:current_piece_placement){
          [
            {
              posx: 2,
              posy: 2,
              type: "queen",
              side: "blue"
            }
          ]
        }
        it "returns true" do
          expect(moves_calculator.move_is_valid?(proposed_move)).to eq true
        end
      end
    end
    context 'if the proposed_move is not valid' do
      context 'if the proposed move is off the board' do
        let(:proposed_move){
          {
            posx: 4,
            posy: 2,
            killed_piece: nil
          }
        }
        it "returns false" do
          expect(moves_calculator.move_is_valid?(proposed_move)).to eq false
        end
      end
      context 'if a wall is in the way' do
        let(:starting_board) {
          {
            :width => 3, :height => 3,
            :boardStack => [],
            :walls => [{posx: 2, posy: 2}],
            :upgradeSquares => []
          }.deep_symbolize_keys
        }
        it "returns false" do
          expect(moves_calculator.move_is_valid?(proposed_move)).to eq false
        end
      end
      context 'if a friendly is in the way' do
        let(:current_piece_placement){
          [
            {
              posx: 2,
              posy: 2,
              type: "queen",
              side: "red"
            }
          ]
        }
        it "returns false" do
          expect(moves_calculator.move_is_valid?(proposed_move)).to eq false
        end
      end
    end
  end








  describe "#space_is_off_board" do
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
    }.deep_symbolize_keys }
    let(:current_piece_placement){[
      {:posx => "1",:posy => "0",:type => "rook",:side => "red"},
      {:posx => "0",:posy => "1",:type => "rook",:side => "blue"}
    ]}
    let(:focal_piece){
      {:posx => 1,:posy => 0,:type => "rook",:side => "red"}
    }
    context 'when the candidate space is off the board' do
      let(:candidate_space) { {posx: 99, posy: 0} }
      it "returns movable false and killable false" do
        expect(moves_calculator.space_available(candidate_space)).to eq({
            movable: false,
            killed_piece: nil
          })
      end
    end
    context 'when the candidate space contains a friendly piece' do
      let(:focal_piece){
        {:posx => 1,:posy => 0,:type => "rook",:side => "red"}
      }
      let(:candidate_space) { {posx: 1, posy: 1} }
      let(:current_piece_placement){[
      {:posx => "1",:posy => "0",:type => "rook",:side => "red"},
      {:posx => "1",:posy => "1",:type => "rook",:side => "red"}
    ]}
      it "returns movable false and killable false" do
        expect(moves_calculator.space_available(candidate_space)).to eq({
            movable: false,
            killed_piece: nil
          })
      end
    end
    context 'when the candidate space contains an enemy piece' do
      let(:candidate_space) { {posx: 1, posy: 1} }
      let(:current_piece_placement){[
      { :posx => "1", :posy => "0", :type => "rook", :side => "blue"},
      { :posx => "1", :posy => "1", :type => "rook", :side => "blue"}
      ]}
      it "returns movable true, the coordinates, and the type and side of the enemy piece" do
        expect(moves_calculator.space_available(candidate_space)).to eq({
            posx: 1, posy: 1,
            movable: true,
            killed_piece: {type: "rook", side: "blue"}
          })
      end
    end
    context 'when the candidate space contains a wall' do
      let(:candidate_space) { {posx: 1, posy: 1} }
      let(:starting_board) {
        {
          "width" => 3, "height" => 3,
          "boardStack" => [],
          "walls" => [{"posx" => "1", "posy" => "1"}],
          "upgradeSquares" => []
        }.deep_symbolize_keys
      }
      it 'returns movable false' do
        expect(moves_calculator.space_available(candidate_space)).to eq({
          movable: false,
          killed_piece: nil
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
        :posx => "0",
        :posy => "0",
        :type => type,
        :side => "red"
      }
    ]}
    it "returns the set of valid moves for #{type}" do
      expect do
        moves_calculator.calculate_moves
      end.to_not raise_error
    end
  end

  describe '#moves_for_pawn' do
    let(:focal_piece) { {:posx => 1,:posy => 1,:type => "pawn",:side => "red"} }

    context 'if no other pieces are around' do
      let(:current_piece_placement){
        [
          {:posx => "1", :posy => "1", :type => "pawn", :side => "red"}
        ]
      }
      it "calls the right method" do
        expect(moves_calculator).to receive(:moves_for_pawn)
        moves_calculator.calculate_moves
      end
      it "returns all and only the cardinal directions only as moveable" do
        expect(moves_calculator.calculate_moves.to_set).to eq([
          {:posx => 1,:posy => 0, killed_piece: nil},
          {:posx => 1,:posy => 2, killed_piece: nil},
          {:posx => 2,:posy => 1, killed_piece: nil},
          {:posx => 0,:posy => 1, killed_piece: nil},
        ].to_set)
      end
      context 'if in the corner' do
        let(:focal_piece) { {:posx => 0,:posy => 0,:type => "pawn",:side => "red"} }

        it "doesn't try to move off the board" do
          expect(moves_calculator.calculate_moves.to_set).to eq([
            {:posx => 0,:posy => 1, killed_piece: nil},
            {:posx => 1,:posy => 0, killed_piece: nil}
          ].to_set)
        end
      end
    end
    context 'if it surrounded by hostile pieces' do

      let(:current_piece_placement) {[
        {:posx => "0",:posy => "0",:type => "pawn",:side => "blue"},
        {:posx => "1",:posy => "0",:type => "pawn",:side => "blue"},
        {:posx => "2",:posy => "0",:type => "pawn",:side => "blue"},
        {:posx => "0",:posy => "1",:type => "pawn",:side => "blue"},
        {:posx => "2",:posy => "1",:type => "pawn",:side => "blue"},
        {:posx => "0",:posy => "2",:type => "pawn",:side => "blue"},
        {:posx => "1",:posy => "2",:type => "pawn",:side => "blue"},
        {:posx => "2",:posy => "2",:type => "pawn",:side => "blue"}
      ]}

      it "returns only the diagonal directions as killable" do
        expect(moves_calculator.calculate_moves.to_set).to eq([
          {:posx => 0,:posy => 0, killed_piece: {:type => "pawn",:side => "blue"}},
          {:posx => 2,:posy => 2, killed_piece: {:type => "pawn",:side => "blue"}},
          {:posx => 0,:posy => 2, killed_piece: {:type => "pawn",:side => "blue"}},
          {:posx => 2,:posy => 0, killed_piece: {:type => "pawn",:side => "blue"}},
        ].to_set)
      end
    end
  end

  let(:starting_board) {
    {
      "width" => 5, "height" => 5,
      "boardStack" => [],
      "walls" => [],
      "upgradeSquares" => []
    }.deep_symbolize_keys
  }
  describe '#moves_for_bishop' do
    let(:focal_piece) { {:posx => 2,:posy => 2,:type => "bishop",:side => "red"} }
    let(:current_piece_placement){
      [
        {
          :posx => "2",
          :posy => "2",
          :type => "bishop",
          :side => "red"
        },
        {
          :posx => "1",
          :posy => "1",
          :type => "rook",
          :side => "red"
        },
        {
          :posx => "1",
          :posy => "3",
          :type => "rook",
          :side => "blue"
        }
      ]
    }
    it "moves and kill diagonally, stopping when it hits the board edge, hits a friendly or kills an enemy piece" do
      expect(moves_calculator.calculate_moves.to_set).to eq([
          {:posx => 1,:posy => 3, killed_piece: {:type => "rook",:side => "blue"}},
          {:posx => 3,:posy => 1, killed_piece: nil},
          {:posx => 4,:posy => 0, killed_piece: nil},
          {:posx => 3,:posy => 3, killed_piece: nil},
          {:posx => 4,:posy => 4, killed_piece: nil},
        ].to_set)
    end
  end
  describe '#moves_for_rook' do
    let(:focal_piece) {{
      posx: 2,
      posy: 2,
      type: "rook",
      side: "red"
    }}
    let(:current_piece_placement) {[
      {
        posx: "2",
        posy: "2",
        type: "rook",
        side: "red"
      },
      {
        posx: "2",
        posy: "1",
        type: "pawn",
        side: "red"
      },
      {
        posx: "1",
        posy: "2",
        type: "pawn",
        side: "blue"
      }
    ]}
    it "moves and kills cardinally, stopping when it hits the board edge, hits a friendly or kills an enemy piece" do
      expect(moves_calculator.calculate_moves.to_set).to eq([
        {
          posx: 1,
          posy: 2,
          killed_piece: {
            type: "pawn",
            side: "blue"
          }
        },
        {
          :posx => 3,
          :posy => 2,
          killed_piece: nil
        },
        {
          :posx => 4,
          :posy => 2,
          killed_piece: nil
        },
        {
          :posx => 2,
          :posy => 3,
          killed_piece: nil
        },
        {
          :posx => 2,
          :posy => 4,
          killed_piece: nil
        },
      ].to_set)
    end
  end
  describe '#moves_for_queen' do
    let(:focal_piece) {{
      posx: 2,
      posy: 2,
      type: "queen",
      side: "red"
    }}
    let(:current_piece_placement) {[
      {
        posx: "2",
        posy: "2",
        type: "queen",
        side: "red"
      },
      {
        posx: "2",
        posy: "1",
        type: "pawn",
        side: "red"
      },
      {
        posx: "1",
        posy: "1",
        type: "pawn",
        side: "red"
      },
      {
        posx: "1",
        posy: "3",
        type: "pawn",
        side: "blue"
      },
      {
        posx: "2",
        posy: "3",
        type: "rook",
        side: "blue"
      },
    ]}
    it "moves and kills both diagonally and cardinally, stopping when it hits the board edge, hits a friendly or kills an enemy piece" do
      expect(moves_calculator.calculate_moves.to_set).to eq([
          {
            posx: 1, posy: 3, killed_piece: { type: "pawn", side: "blue"}
          },
          {
            posx: 2, posy: 3, killed_piece: { type: 'rook', side: 'blue'}
          },
          {
            posx: 3,
            posy: 1,
            killed_piece: nil
          },
          {
            posx: 4,
            posy: 0,
            killed_piece: nil
          },
          {
            posx: 3,
            posy: 3,
            killed_piece: nil
          },
          {
            posx: 4,
            posy: 4,
            killed_piece: nil
          },
          {
          posx: 3,
          posy: 2,
          killed_piece: nil
        },
        {
          posx: 4,
          posy: 2,
          killed_piece: nil
        },
        {
          posx: 0,
          posy: 2,
          killed_piece: nil
        },
        {
          posx: 1,
          posy: 2,
          killed_piece: nil
        }
        ].to_set)
    end
  end

  describe 'moves_for_king' do
    let(:focal_piece) {{
      posx: 2,
      posy: 2,
      type: "king",
      side: "red"
    }}
        let(:current_piece_placement) {[
      {
        posx: "2",
        posy: "2",
        type: "queen",
        side: "king"
      },
      {
        posx: "2",
        posy: "1",
        type: "pawn",
        side: "red"
      },
      {
        posx: "1",
        posy: "1",
        type: "pawn",
        side: "red"
      },
      {
        posx: "1",
        posy: "3",
        type: "pawn",
        side: "blue"
      },
      {
        posx: "2",
        posy: "3",
        type: "rook",
        side: "blue"
      },
    ]}
    it "moves or kills in all directions only one space" do
      expect(moves_calculator.calculate_moves.to_set).to eq([
        {
          posx: 1, posy: 3, killed_piece: { type: "pawn", side: "blue"}
        },
        {
          posx: 2, posy: 3, killed_piece: { type: 'rook', side: 'blue'}
        },
        {
          posx: 3,
          posy: 1,
          killed_piece: nil
        },
        {
          posx: 3,
          posy: 3,
          killed_piece: nil
        },
        {
          posx: 3,
          posy: 2,
          killed_piece: nil
        },
        {
          posx: 1,
          posy: 2,
          killed_piece: nil
        }
      ].to_set)
    end
  end
  describe '#moves_for_knight' do
    let(:focal_piece) {{
      posx: 2,
      posy: 2,
      type: "knight",
      side: "red"
    }}
        let(:current_piece_placement) {[
      {
        posx: "2",
        posy: "2",
        type: "queen",
        side: "knight"
      },
      {
        posx: "0",
        posy: "1",
        type: "pawn",
        side: "red"
      },
      {
        posx: "2",
        posy: "1",
        type: "pawn",
        side: "red"
      },
      {
        posx: "1",
        posy: "1",
        type: "pawn",
        side: "red"
      },
      {
        posx: "0",
        posy: "3",
        type: "pawn",
        side: "blue"
      },
      {
        posx: "1",
        posy: "3",
        type: "pawn",
        side: "blue"
      },
      {
        posx: "2",
        posy: "3",
        type: "rook",
        side: "blue"
      },
    ]}
    it "moves or kills like a knight do" do
      expect(moves_calculator.calculate_moves.to_set).to eq([
        {
          posx: 0, posy: 3, killed_piece: { type: "pawn", side: "blue"}
        },
        {
          posx: 4, posy: 3, killed_piece: nil
        },
        {
          posx: 4, posy: 1, killed_piece: nil

        },
        {
          posx: 1, posy: 4, killed_piece: nil
        },
        {
          posx: 1, posy: 0, killed_piece: nil
        },
        {
          posx: 3, posy: 4, killed_piece: nil
        },
        {
          posx: 3, posy: 0, killed_piece: nil
        }
      ].to_set)
    end
  end
  describe 'walls' do
    context 'when a piece is going to hit one' do
      let(:focal_piece) {{
        posx: 1,
        posy: 1,
        type: "king",
        side: "red"
      }}
      let(:current_piece_placement) {[
        focal_piece
      ]}
  let(:starting_board) {
    {
      :width => 3, :height => 3,
      :boardStack => [],
      :walls => [
        {
          :posx => "0",
          :posy => "0"
        },
        {
          :posx => "0",
          :posy => "1"
        },
        {
          :posx => "0",
          :posy => "2"
        },
        {
          :posx => "2",
          :posy => "0"
        },
        {
          :posx => "2",
          :posy => "1"
        },
        {
          :posx => "2",
          :posy => "2"
        },
      ],
      :upgradeSquares => []
    }
  }
      it 'stops' do
        expect(moves_calculator.calculate_moves).to eq([
          {
            posx: 1,
            posy: 0,
            killed_piece: nil
          },
          {
            posx: 1,
            posy: 2,
            killed_piece: nil
          }
        ])
      end
    end
  end
end