# frozen_string_literal: true

require_relative '../lib/connect_four/board'

describe Board do
  let(:board) { Board.new }
  it 'Has Board Class' do
    expect(board).to be_kind_of(Board)
  end
  it 'Render board as expected' do
    expected = "◯ ◯ ◯ ◯ ◯ ◯ ◯\n◯ ◯ ◯ ◯ ◯ ◯ ◯\n◯ ◯ ◯ ◯ ◯ ◯ ◯\n◯ ◯ ◯ ◯ ◯ ◯ ◯\n◯ ◯ ◯ ◯ ◯ ◯ ◯\n◯ ◯ ◯ ◯ ◯ ◯ ◯\n0 1 2 3 4 5 6\n"
    result = board.to_s
    expect(result).to eq(expected)
  end
end
