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
  it 'return the index of next empty slot at column index 1' do
    board.drop_token(1, Board::RED_TOKEN)
    board.drop_token(1, Board::RED_TOKEN)
    board.drop_token(1, Board::RED_TOKEN)
    result = board.next_empty_slot(1)
    expect(result).to eq(2)
  end
  it 'drop token at the column 1' do
    expected_board_layout = [['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
                             ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
                             ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
                             ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
                             ['◯', '◯', '◯', '◯', '◯', '◯', '◯'],
                             ['◯', '⏺', '◯', '◯', '◯', '◯', '◯']]
    board.drop_token(1, '⏺')
    expect(board.board_layout).to eq(expected_board_layout)
  end
  it 'return true when four are connected horizontally' do
    board.drop_token(1, Board::WHITE_TOKEN)
    board.drop_token(2, Board::WHITE_TOKEN)
    board.drop_token(3, Board::WHITE_TOKEN)
    board.drop_token(4, Board::WHITE_TOKEN)
    result = board.four_in_row?
    expect(result).to be true
  end
  it 'return true when four are connected in column' do
    board.drop_token(1, Board::WHITE_TOKEN)
    board.drop_token(1, Board::WHITE_TOKEN)
    board.drop_token(1, Board::WHITE_TOKEN)
    board.drop_token(1, Board::WHITE_TOKEN)
    result = board.four_in_column?
    expect(result).to be true
  end
  it 'return true when match in primary diagonal' do
    board.drop_token(0, Board::RED_TOKEN)
    board.drop_token(1, Board::RED_TOKEN)
    board.drop_token(2, Board::WHITE_TOKEN)
    board.drop_token(3, Board::WHITE_TOKEN)
    board.drop_token(0, Board::WHITE_TOKEN)
    board.drop_token(0, Board::WHITE_TOKEN)
    board.drop_token(0, Board::WHITE_TOKEN)
    board.drop_token(1, Board::WHITE_TOKEN)
    board.drop_token(2, Board::WHITE_TOKEN)
    board.drop_token(1, Board::WHITE_TOKEN)
    result = board.primary_diagonal?
    expect(result).to be true
  end
  it 'return true when match in secondary diagonal' do
    board.drop_token(3, Board::RED_TOKEN)
    board.drop_token(4, Board::WHITE_TOKEN)
    board.drop_token(5, Board::WHITE_TOKEN)
    board.drop_token(6, Board::WHITE_TOKEN)
    board.drop_token(4, Board::RED_TOKEN)
    board.drop_token(5, Board::WHITE_TOKEN)
    board.drop_token(6, Board::WHITE_TOKEN)
    board.drop_token(5, Board::RED_TOKEN)
    board.drop_token(6, Board::WHITE_TOKEN)
    board.drop_token(6, Board::RED_TOKEN)
    result = board.secondary_diagonal?
    expect(result).to be true
  end
end
