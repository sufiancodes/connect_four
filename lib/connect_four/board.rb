# frozen_string_literal: true

class Board # rubocop:disable Style/Documentation
  attr_accessor :board_layout

  EMPTY_TOKEN = "\u25ef"
  WHITE_TOKEN = "\e[37m\u23FA\e[0m"
  RED_TOKEN = "\e[31m\u23FA\e[0m"

  NUMBER_OF_ROWS = 6
  NUMBER_OF_COLUMN = 7

  def initialize
    @board_layout = Array.new(6) { Array.new(7) { EMPTY_TOKEN } }
  end

  def to_s
    col_nums = "\n#{(0...NUMBER_OF_COLUMN).map(&:to_s).join(' ')}\n"
    @board_layout.map { it.join(' ') }.join("\n") + col_nums
  end

  def column_at(index)
    board_layout.transpose[index]
  end

  def next_empty_slot(col_index)
    column = column_at(col_index)
    i = 0
    i += 1 while i <= 6 && column[i] == EMPTY_TOKEN
    i
  end
end
w = "\e[37m\u23FA\e[0m"

board = Board.new
puts board.next_empty_slot(1)
# puts board
