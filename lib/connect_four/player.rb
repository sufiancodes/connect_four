class Player
  attr_accessor :first_player, :second_player

  def initialize
    @first_player = nil
    @second_player = nil
  end

  def welcome
    puts 'Enter the name of first player'
    self.first_player = gets.chomp
    puts 'Enter the name of second player'
    self.second_player= gets.chomp
  end
end
