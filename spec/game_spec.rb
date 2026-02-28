require_relative '../lib/connect_four/game'

describe Game do
  let(:board) { instance_double 'Board' }

  let(:game) { Game.new(board) }
  it 'Has the Game class' do
    expect(game).to be_kind_of(Game)
  end
  context 'In case of Game over' do
    it 'return true when the match in row' do
      allow(board).to receive(:four_in_row?).and_return(true)
      expect(game.over?).to eq(true)
    end
    it 'return true when match in column' do
      allow(board).to receive(:four_in_row?).and_return(false)
      allow(board).to receive(:four_in_column?).and_return(true)
      expect(game.over?).to eq(true)
    end
    it 'return true when match in primary diagonal' do
      allow(board).to receive(:four_in_row?).and_return(false)
      allow(board).to receive(:four_in_column?).and_return(false)
      allow(board).to receive(:primary_diagonal?).and_return(true)
      expect(game.over?).to eq(true)
    end
    it 'return true when match in secondary diagonal' do
      allow(board).to receive(:four_in_row?).and_return(false)
      allow(board).to receive(:four_in_column?).and_return(false)
      allow(board).to receive(:primary_diagonal?).and_return(false)
      allow(board).to receive(:secondary_diagonal?).and_return(true)
      expect(game.over?).to eq(true)
    end
    it 'return false when no match exist' do
      allow(board).to receive(:four_in_row?).and_return(false)
      allow(board).to receive(:four_in_column?).and_return(false)
      allow(board).to receive(:primary_diagonal?).and_return(false)
      allow(board).to receive(:secondary_diagonal?).and_return(false)
      expect(game.over?).to eq(false)
    end
  end
end
