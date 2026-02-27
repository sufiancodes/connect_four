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
end
