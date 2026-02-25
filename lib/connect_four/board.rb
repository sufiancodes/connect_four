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
    col_numb = "\n#{(0...NUMBER_OF_COLUMN).map(&:to_s).join(' ')}\n"
    @board_layout.map { it.join(' ') }.join("\n") + col_numb
  end

  def column_at(index)
    board_layout.transpose[index]
  end

  def next_empty_slot(col_index)
    column = column_at(col_index)
    i = 0
    i += 1 while i <= 6 && column[i] == EMPTY_TOKEN
    i - 1
  end

  def drop_token(column, token)
    row = next_empty_slot(column)
    board_layout[row][column] = token
  end

  def four_in_row?
    board_layout.any? { check_match(it) }
  end

  def four_in_column?
    board_layout.transpose.any? { check_match(it) }
  end

  def primary_diagonal?
    board_layout.take(3).each_with_index do |row, i|
      row.take(4).each_with_index do |token, j|
        return true if consecutive_diagonal_tokens?(i, j, token, board_layout)
      end
    end
    false
  end

  def secondary_diagonal?
    board_layout.reverse.take(3).each_with_index do |row, i|
      row.take(4).each_with_index do |token, j|
        return true if consecutive_diagonal_tokens?(i, j, token, board_layout.reverse)
      end
    end
    false
  end

  private

  def check_match(row)
    row.each_cons(4).any? do |slice|
      slice.all?(RED_TOKEN) || slice.all?(WHITE_TOKEN)
    end
  end

  def consecutive_diagonal_tokens?(row, col, token, board_layout)
    consecutive_tokens = (1..3).map { board_layout[row + it][col + it] }
    consecutive_tokens.all? { [WHITE_TOKEN, RED_TOKEN].include?(it) }
  end
end
