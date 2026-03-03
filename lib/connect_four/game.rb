# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
class Game
  attr_accessor :board, :moves, :player

  def initialize(board = Board.new)
    @current_player = nil
    @board = board
    @moves = 0
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
