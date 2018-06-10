require_relative 'policies/conway_policy'
require_relative 'models/cell'
require_relative 'cell_neighbors'

class GameOfLife
  DEFAULT_GENERATIONS = 10
  DEFAULT_POLICY = ConwayPolicy.new
  DEFAULT_BLOCK_PATTERN = [
    Cell.new(alive: true, x_coord: 1, y_coord: 1),
    Cell.new(alive: true, x_coord: 2, y_coord: 1),
    Cell.new(alive: true, x_coord: 1, y_coord: 2),
    Cell.new(alive: true, x_coord: 2, y_coord: 2),
  ]

  attr_reader :policy, :cells

  def initialize(policy: DEFAULT_POLICY, grid: nil, cells: DEFAULT_BLOCK_PATTERN)
    @policy = policy
    @grid = grid
    @cells = cells
    @cell_neighbors = CellNeighbors.new(cells: cells)
  end

  def start(generations=DEFAULT_GENERATIONS)
    generations.times { tick }
  end

  def tick
    cells.map { |c|  policy.process(c, cell_neighbors(c)) }
  end
end
