require_relative "../lib/connect_four/player"

describe Player do
  let(:player) {Player.new}
  it "it creates player class" do
    
    expect(player).to be_kind_of(Player)
  end
  xit "ask user for their names" do
    
  end
  it "Welcome the players by their name" do
    player.player_one = "Alex"
    player.player_two = "Jack"
    expect(player.welcome).to eq("Welcome Alex and Jack")
  end
end
