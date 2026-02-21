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
  it 'return the array of tokens at column index 1' do
    expected = Array.new(Board::NUMBER_OF_ROWS) { Board::EMPTY_TOKEN }
    result = board.column_at(1)
    expect(result).to eq(expected)
  end
  it 'return the next empty slot at column index 1' do
    board.instance_variable_set(:@board_layout, [['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
                                                 ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
                                                 ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
                                                 ['◯', '⏺', '◯', '◯', '◯', '◯', '◯'],
                                                 ['◯', '⏺', '◯', '◯', '◯', '◯', '◯'],
                                                 ['◯', '⏺', '◯', '◯', '◯', '◯', '◯']])
    expected = board.board_layout[2][1]
    result = board.next_empty_slot(1)
    expect(result).to eq(expected)
  end
end
