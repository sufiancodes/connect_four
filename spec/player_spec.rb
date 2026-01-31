require_relative "../lib/connect_four/player"

describe Player do
  it "Welcome the players" do
    expect(Player.welcome).to eq("Welcome\nPerson to go first is Player_one(Red) and person to go second is Player_two(Yellow)")
  end
end
