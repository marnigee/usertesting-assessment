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

  attr_reader :policy, :cells, :cell_neighbors

  def initialize(
    policy: DEFAULT_POLICY,
    grid: nil,
    cells: DEFAULT_BLOCK_PATTERN
  )
    @policy = policy
    @grid = grid
    @cells = cells
    @cell_neighbors = CellNeighbors.new(cells: @cells)
  end

  def start(generations = DEFAULT_GENERATIONS)
    raise 'Position violation' unless valid?
    generations.times { tick }
  end

  def tick
    cells.map do |c|
      policy.evaluate_cells(cell: c, neighbors: @cell_neighbors.neighbors(c))
    end
    policy.update_cells
  end

  def valid?
    !position_violation
  end

  def position_violation
    cells.combination(2).any? do |a, b|
      a.x_coord == b.x_coord && a.y_coord == b.y_coord
    end
  end
end
