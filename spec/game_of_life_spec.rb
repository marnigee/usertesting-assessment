require_relative '../lib/game_of_life'

describe GameOfLife do
  let(:grid) { double(:grid)}
  let(:cells) { double(:cells)}
  let(:game_of_life) { GameOfLife.new }

  it 'uses default Conway rules' do
    expect(game_of_life.policy).to be_a(ConwayPolicy)  
  end

  it 'uses default number of generations' do
    allow(game_of_life).to receive(:tick)
    default_generations = GameOfLife::DEFAULT_GENERATIONS

    game_of_life.start

    expect(game_of_life).to have_received(:tick).exactly(default_generations).times
  end

  it 'uses default block pattern' do
    upper_left_block = game_of_life.cells.any? { |c|  c.x_coord == 1 && c.y_coord == 1}
    upper_right_block = game_of_life.cells.any? { |c|  c.x_coord == 2 && c.y_coord == 1}
    lower_left_block = game_of_life.cells.any? { |c|  c.x_coord == 1 && c.y_coord == 2}
    lower_right_block = game_of_life.cells.any? { |c|  c.x_coord == 2 && c.y_coord == 1}

    expect(game_of_life.cells.size).to equal(4)
    expect(upper_left_block).to be(true)
    expect(upper_right_block).to be(true)
    expect(lower_left_block).to be(true)
    expect(lower_right_block).to be(true)
  end
end
