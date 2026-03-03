require_relative '../lib/connect_four/player'

describe Player do
  let(:player) { Player.new }
  it 'Prompts first user for their name and save it' do
    expect(player).to(receive(:gets).and_return('Alex', 'Alexa'))
    expect { player.welcome }.to output(/Enter the name of first player/).to_stdout
    expect(player.first_player).to eq('Alex')
  end
  it 'Prompts second user for their name and save it' do
    expect(player).to(receive(:gets).and_return('Alex', 'Alexa'))
    expect { player.welcome }.to output(/Enter the name of second player/).to_stdout
    expect(player.second_player).to eq('Alexa')
  end
  it 'returns first player name when turn is 0 (current_name)' do
    player.first_player = 'Alex'
    player.second_player = 'Alexa'
    player.turn = 0
    expect(player.current_name).to eq('Alex')
  end

  it 'returns second player name when turn is 1 (current_name)' do
    player.first_player = 'Alex'
    player.second_player = 'Alexa'
    player.turn = 1
    expect(player.current_name).to eq('Alexa')
  end

  it 'switches turn from 0 to 1 (switch!)' do
    player.turn = 0
    player.switch!
    expect(player.turn).to eq(1)
  end

  it 'switches turn from 1 to 0 (switch!)' do
    player.turn = 1
    player.switch!
    expect(player.turn).to eq(0)
  end
end
