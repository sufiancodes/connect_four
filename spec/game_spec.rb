require_relative '../lib/connect_four/game'

describe Game do
  let(:game) {Game.new}
  it 'Has the Game class' do
    expect(game).to be_kind_of(Game)
  end
end