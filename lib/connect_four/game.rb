# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
class Game
  attr_accessor :board, :moves

  def initialize(board = Board.new)
    @current_player = nil
    @board = board
    @moves = 40
    @player = Player.new
  end

  def over?
    if @board.four_in_row? || @board.four_in_column? || @board.primary_diagonal? || @board.secondary_diagonal?
      return true
    end

    false
  end

  def welcome
    @player.welcome
  end
end

game = Game.new

# while game.over? != true && game.moves != 42
#   game.welcome
#   puts game.board
#   puts 'White or Red'
#   token = gets.chomp
#   puts 'Enter Column to drop'
#   column = gets.chomp.to_i
#   if token == 'white'
#     game.board.drop_token(column, Board::WHITE_TOKEN)
#     game.moves += 1
#   else
#     game.board.drop_token(column, Board::RED_TOKEN)
#     game.moves += 1

#   end
#   puts game.board
# end

# At 42 moves its supposed to be draw
# until game.over?
#   print_board
#   prompt_input
#   drop_token
# end

# display_end_result
