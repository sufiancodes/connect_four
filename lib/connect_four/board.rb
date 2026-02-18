# frozen_string_literal: true

class Board # rubocop:disable Style/Documentation
  attr_accessor :board_layout

  EMPTY_TOKEN = "\u25ef"
  WHITE_TOKEN = "\u25cf"
  BLACK_TOKEN = "\u26ab"

  NUMBER_OF_ROWS = 6
  NUMBER_OF_COLUMN = 7
end

board = Board.new

puts "\u22C5"
puts "\u25CF"