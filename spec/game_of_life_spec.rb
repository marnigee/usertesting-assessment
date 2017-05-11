require_relative '../lib/game_of_life'

describe GameOfLife do
  let(:grid) { double(:grid)}
  let(:cells) { double(:cells)}
  let(:game_of_life) { 
    GameOfLife.new(
      grid: grid,
      cells: cells
    )
  }

  it 'uses default Conway rules' do
    expect(game_of_life.policy).to be_a(ConwayPolicy)  
  end

  it 'uses default number of generations' do
    allow(game_of_life).to receive(:tick)
    default_generations = GameOfLife::DEFAULT_GENERATIONS

    game_of_life.start

    expect(game_of_life).to have_received(:tick).exactly(default_generations).times
  end
end
