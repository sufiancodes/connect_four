# File to all the logic related to board
class Board
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
end
