require_relative '../lib/connect_four/board'

describe Board do
  let(:board) { Board.new }
  it 'Has Board Class' do
    expect(board).to be_kind_of(Board)
  end
  it "Render's View" do
    board_layout = [
      %w[a1 a2 a3 a4 a5 a6 a7],
      %w[b1 b2 b3 b4 b5 b6 b7],
      %w[c1 c2 c3 c4 c5 c6 c7],
      %w[d1 d2 d3 d4 d5 d6 d7],
      %w[e1 e2 e3 e4 e5 e6 e7],
      %w[f1 f2 f3 f4 f5 f6 f7]
    ]
    result = board.render_view
    expect(result).to eq(board_layout)
  end
end