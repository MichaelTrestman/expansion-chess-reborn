require 'rails_helper'

RSpec.xdescribe BoardStateUpdater do
  let(:board_state_updater) do
    described_class.new(board_state_updater_args)
  end
  let(:board_state_updater_args) do
    {
      focal_piece: {posx: 1, posy: 2, type: 'pawn', side: 'purple'},
      current_piece_placement: current_piece_placement,
      walls: walls,
      upgrade_squares: upgrade_squares,
      proposed_move: proposed_move
    }
  end
  context 'nilsville' do
    let(:current_piece_placement) { nil }
    let(:walls) { nil }
    let(:upgrade_squares) { nil }
    let(:proposed_move) { nil }
    it "is" do
      expect{board_state_updater}.to_not raise_error
    end
  end



end