# frozen_string_literal: true

require_relative '../lib/connect_four/board'

describe Board do # rubocop:disable Metrics/BlockLength
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
  it "manipulate's view on demand" do
    expected_board_layout = [
      %w[🟡 a2 a3 a4 a5 a6 a7],
      %w[b1 b2 b3 b4 b5 b6 b7],
      %w[c1 c2 c3 c4 c5 c6 c7],
      %w[d1 d2 d3 d4 d5 d6 d7],
      %w[e1 e2 e3 e4 e5 e6 e7],
      %w[f1 f2 f3 f4 f5 f6 f7]
    ]
    result = board.change_view('a1', '🟡')
    expect(result).to eq(expected_board_layout)
  end
  it "return's true when four are connected horizontally" do
    board.instance_variable_set(:@board_layout, [
                                  %w[a1 a2 🟡 🟡 🟡 🟡 a7],
                                  %w[b1 b2 b3 b4 b5 b6 b7],
                                  %w[c1 c2 c3 c4 c5 c6 c7],
                                  %w[d1 d2 d3 d4 d5 d6 d7],
                                  %w[e1 e2 e3 e4 e5 e6 e7],
                                  %w[f1 f2 f3 f4 f5 f6 f7]
                                ])
    result = board.check_horizontal_connection
    expect(result).to be true
  end
  it "return's true when four are connected vertically" do
    board.instance_variable_set(:@board_layout, [
                                  %w[a1 a2 🟡 a4 a5 a6 a7],
                                  %w[b1 b2 🟡 b4 b5 b6 b7],
                                  %w[c1 c2 🟡 c4 c5 c6 c7],
                                  %w[d1 d2 🟡 d4 d5 d6 d7],
                                  %w[e1 e2 e3 e4 e5 e6 e7],
                                  %w[f1 f2 f3 f4 f5 f6 f7]
                                ])
    result = board.check_vertical_connection
    expect(result).to be true
  end
  it 'return true when there is match in primary diagonal' do
    board.instance_variable_set(:@board_layout, [
                                  %w[🟡 a2 a3 a4 a5 a6 a7],
                                  %w[b1 🟡 b3 b4 b5 b6 b7],
                                  %w[c1 c2 🟡 c4 c5 c6 c7],
                                  %w[d1 d2 d3 🟡 d5 d6 d7],
                                  %w[e1 e2 e3 e4 e5 e6 e7],
                                  %w[f1 f2 f3 f4 f5 f6 f7]
                                ])
    result = board.check_primary_diagonal
    expect(result).to be true
  end
  xit 'return true when there is match in secondary diagonal' do
    board.instance_variable_set(:@board_layout, [
                                  %w[a1 a2 a3 a4 a5 a6 🟡],
                                  %w[b1 b2 b3 b4 b5 🟡 b7],
                                  %w[c1 c2 c3 c4 🟡 c6 c7],
                                  %w[d1 d2 d3 🟡 d5 d6 d7],
                                  %w[e1 e2 e3 e4 e5 e6 e7],
                                  %w[f1 f2 f3 f4 f5 f6 f7]
                                ])
    result = board.check_primary_diagonal
    expect(result).to be true
  end
end
