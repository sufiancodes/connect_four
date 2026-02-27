require_relative '../lib/connect_four/game'

describe Game do
  let(:game) {Game.new}
  let(:board) {instance_double 'Board'}
  it 'Has the Game class' do
    expect(game).to be_kind_of(Game)
  end
  it 'return true when game is over' do
    allow(board).to receive(:four_in_row?).and_return(true)
    expect(game.over?).to eq(true)
  end
end