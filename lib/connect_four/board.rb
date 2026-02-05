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
    board_layout.each do |value|
      value.each_with_index do |_inner_value, index|
        if value[index] == value [index + 1] && value[index + 2] == value[index] && value[index + 3] == value[index]
          return true
        end
      end
    end
    false
  end

  def check_vertical_connection
    # there will be same 🟡 value after every 7 moves
    rotated_board = board_layout.transpose
    rotated_board.each do |value|
      value.each_with_index do |_inner_value, index|
        if value[index] == value [index + 1] && value[index + 2] == value[index] && value[index + 3] == value[index]
          return true
        end
      end
    end
    false
  end

  def check_primary_diagonal
    flat_board = board_layout.flatten
    flat_board.each_with_index do |element, index|
      if flat_board[index] == flat_board[index + 8] && flat_board[index] == flat_board[index + 16] && flat_board[index] == flat_board[index + 24]
        return true
      end
    end
    false
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
# cl = Board.new
# p cl.check_vertical_connection

# a = Matrix[[1, 2, 3],
#            [1, 5, 6],
#            [1, 8, 9]
#           ]
# puts a
# p a.column_size
# b = a.diagonal
# b.each do |e|
#   pp e
#   e.each_with_index do |c, i|
#     if e[i] == e[i+1] && e[i+2]
#       puts true
#     end
#     return
#   end
# end
# def diagonal_down?(symbol)
#   Matrix.rows(board_state).each(:diagonal).all? { it.symbol == symbol }
# end
# puts diagonal_down?(a)
# a.each(:diagonal) do |e|
#   puts e
# end
# 6,7
# aa = Matrix.build(2, 2) { |row, col| row+col}
# pp aa
# a = Matrix.build(2, 4) do |row, col|
#   row+1
# end
# pp a
# p Array.new(4) { |e| e + 1 }
# pp board_layout

# pp a
# pp board_layout
