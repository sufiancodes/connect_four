require_relative 'board'
class Game
  def initialize(board = Board.new)
    @current_player = nil
    @board = board
  end

  def over?
    if @board.four_in_row? || @board.four_in_column? || @board.primary_diagonal? || @board.secondary_diagonal?
      return true
    end

    false
  end
end
