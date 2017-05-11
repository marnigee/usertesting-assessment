require_relative 'policies/conway_policy'

class GameOfLife
  DEFAULT_GENERATIONS = 10
  DEFAULT_POLICY = ConwayPolicy.new

  attr_reader :policy

  def initialize(policy: DEFAULT_POLICY, grid:, cells:)
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
