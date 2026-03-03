class Player
  attr_accessor :first_player, :second_player, :turn

  def initialize
    @first_player = nil
    @second_player = nil
    @turn = 0
  end

  def welcome
    puts 'Enter the name of first player'
    self.first_player = gets.chomp
    puts 'Enter the name of second player'
    self.second_player = gets.chomp
  end

  def current_name
    if turn.zero?
      first_player
    else
      second_player
    end
  end

  def switch!
    self.turn = (turn.zero? ? 1 : 0)
  end
end
