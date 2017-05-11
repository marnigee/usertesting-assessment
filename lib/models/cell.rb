class Cell
  attr_reader :alive, :x_coord, :y_coord

  def initialize(alive, x_coord, y_coord)
    @alive = alive
    @x_coord = x_coord
    @y_coord = y_coord
  end

  def rebirth
    alive = true
  end

  def kill
    alive = false
  end
end
