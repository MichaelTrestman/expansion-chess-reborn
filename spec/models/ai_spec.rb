RSpec.describe AI do
  let (:ai) do
    described_class.new ai_args
  end
  let(:ai_args){{
    current_turn: current_turn,
    current_piece_placement: current_piece_placement,
    starting_board: starting_board
  }}
  let(:current_turn) {'red'}
  let(:current_piece_placement){[
    {
      posx: "1",
      posy: "1",
      type: 'king',
      side: 'red'
    },
    {
      posx: "1",
      posy: "0",
      type: 'queen',
      side: 'red'
    },
    {
      posx: "2",
      posy: "1",
      type: 'king',
      side: 'blue'
    },
    {
      posx: "2",
      posy: "0",
      type: 'queen',
      side: 'blue'
    },
  ]}
  let(:starting_board) {
    {
      :width => 3, :height => 3,
      :boardStack => [],
      :walls => [],
      :upgradeSquares => []
    }
  }
  it "exists" do
    expect{ai}.not_to raise_error
  end

  describe "#pick_random_move" do
    it "picks a random valid move" do
      move_tup = ai.pick_random_move
      focal_piece = move_tup.first
      move = move_tup.last
      expect(move.class).to be Hash
      expect(MovesCalculator.new({
        focal_piece: focal_piece,
        starting_board: starting_board,
        current_piece_placement: current_piece_placement,
        current_turn: current_turn
      }).move_is_valid?(move)).to be true
    end
  end

  describe '#pick_best_move' do
    it "picks the best move it can calculate" do
      puts ai.pick_best_move_no_lookahead
    end
  end
end
