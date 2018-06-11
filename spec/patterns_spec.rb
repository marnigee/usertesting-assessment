require_relative '../lib/game_of_life'

describe 'Patterns' do
  let(:game_of_life) { GameOfLife.new }

  context 'default block pattern' do
    it 'cells are still life in each generation' do
      game_of_life.start(1)

      dead_cells_after_start = game_of_life.cells.any? { |c| c.alive == false }

      expect(dead_cells_after_start).to be(false)
    end
  end
end
