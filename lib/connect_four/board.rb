# frozen_string_literal: true

class Board # rubocop:disable Style/Documentation
  attr_accessor :board_layout

  EMPTY_TOKEN = "\u25ef"
  WHITE_TOKEN = "\e[37m\u23FA\e[0m"
  RED_TOKEN = "\e[31m\u23FA\e[0m"

  NUMBER_OF_ROWS = 6
  NUMBER_OF_COLUMN = 7

  def initialize
    @board_layout = Array.new(6){Array.new(7){EMPTY_TOKEN}}
  end
end

board = Board.new
pp board.board_layout