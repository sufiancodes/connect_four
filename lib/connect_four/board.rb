# frozen_string_literal: true

class Board # rubocop:disable Style/Documentation
  attr_accessor :board_layout

  def initialize
    @board_layout = [
      %w[a1 a2 a3 a4 a5 a6 a7],
      %w[b1 b2 b3 b4 b5 b6 b7],
      %w[c1 c2 c3 c4 c5 c6 c7],
      %w[d1 d2 d3 d4 d5 d6 d7],
      %w[e1 e2 e3 e4 e5 e6 e7],
      %w[f1 f2 f3 f4 f5 f6 f7]
    ]
  end

  def render_view
    @board_layout
  end

  def change_view(position, marker)
    board_layout.each_with_index do |outer_array, index_of_outer_array|
      outer_array.each_with_index do |inner_array, index_of_inner_array|
        board_layout[index_of_outer_array][index_of_inner_array] = marker if inner_array == position
      end
    end
  end

  def check_horizontal_connection
    board_layout.each do |row|
      row.each_cons(4) do |elements|
        return true if elements.uniq.size == 1 && !elements.first.nil?
      end
    end
    false
  end

  def check_vertical_connection
    rotated_board = board_layout.transpose
    rotated_board.each do |row|
      row.each_cons(4) do |elements|
        return true if elements.uniq.size == 1 && !elements.first.nil?
      end
    end
    false
  end

  def check_primary_diagonal

  end

  def check_secondary_diagonal
    flat_board = board_layout.flatten
    flat_board.each_with_index do |element, index|
      if flat_board[index] == flat_board[index + 6] && flat_board[index] == flat_board[index + 12] && flat_board[index] == flat_board[index + 18]
        return true
      end
    end
    false
  end
end

board = Board.new
p board.check_horizontal_connection

board_layout = [
  %w[🟡 🟡 🟡 22 a5 a6 a7],
  %w[b1 b2 b3 b4 b5 b6 b7],
  %w[c1 c2 c3 c4 c5 c6 c7],
  %w[d1 d2 d3 d4 d5 d6 d7],
  %w[e1 e2 e3 e4 e5 e6 e7],
  %w[f1 f2 f3 f4 f5 f6 f7]
]

