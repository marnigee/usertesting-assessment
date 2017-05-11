class Grid
  attr_reader :cells

  def initialize(min_x:, min_y:, max_x:, max_y:)
    @min_x = min_x
    @min_y = min_y
    @max_x = max_x
    @max_y = max_y
  end
end
