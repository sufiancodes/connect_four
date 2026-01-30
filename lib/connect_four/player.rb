# To store basic information related to player and welcome them
# 
class Player
  attr_accessor :player_one, :player_two
  def initialize
    @player_one = player_one
    @player_two = player_two
  end

  def welcome
    "Welcome #{player_one} and #{player_two}"
  end
  
end
