# frozen_string_literal: true

require_relative 'lib/connect_four'
game = Game.new
game.welcome

until game.over?
  puts game.board
  puts "#{game.player.current_name}'s turn. Enter column:"
  col = gets.to_i

  token = game.player.turn.zero? ? Board::WHITE_TOKEN : Board::RED_TOKEN
  game.board.drop_token(col, token)
  game.moves += 1

  break if game.moves == 42

  game.player.switch!
end

puts game.board
puts(game.winner? ? "Winner: #{game.player.current_name}" : 'Draw!')
