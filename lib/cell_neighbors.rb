require_relative 'models/cell'

class CellNeighbors
  attr_reader :cells

  def initialize(cells:)
    @cells = cells
  end

  def neighbors(cell)
    [
      left_neighbor(cell),
      right_neighbor(cell),
      up_neighbor(cell),
      down_neighbor(cell),
      diagonal_left_up_neighbor(cell),
      diagonal_right_up_neighbor(cell),
      diagonal_left_down_neighbor(cell),
      diagonal_right_down_neighbor(cell)
    ]
  end

  def left_neighbor(center_cell)
    neighbor_array = cells.select do |c|
      (center_cell.x_coord == c.x_coord - 1) &&
        (center_cell.y_coord == c.y_coord)
    end
    neighbor_array.first
  end

  def right_neighbor(center_cell)
    neighbor_array = cells.select do |c|
      (center_cell.x_coord == c.x_coord + 1) &&
        (center_cell.y_coord == c.y_coord)
    end
    neighbor_array.first
  end

  def up_neighbor(center_cell)
    neighbor_array = cells.select do |c|
      (center_cell.x_coord == c.x_coord) &&
        (center_cell.y_coord == c.y_coord + 1)
    end
    neighbor_array.first
  end

  def down_neighbor(center_cell)
    neighbor_array = cells.select do |c|
      (center_cell.x_coord == c.x_coord) &&
        (center_cell.y_coord == c.y_coord - 1)
    end
    neighbor_array.first
  end

  def diagonal_left_up_neighbor(center_cell)
    return nil if left_neighbor(center_cell).nil?
    neighbor_array = cells.select do |c|
      (left_neighbor(center_cell).x_coord == c.x_coord) &&
        (left_neighbor(center_cell).y_coord == c.y_coord + 1)
    end
    neighbor_array.first
  end

  def diagonal_right_up_neighbor(center_cell)
    return nil if right_neighbor(center_cell).nil?
    neighbor_array = cells.select do |c|
      (right_neighbor(center_cell).x_coord == c.x_coord) &&
        (right_neighbor(center_cell).y_coord == c.y_coord + 1)
    end
    neighbor_array.first
  end

  def diagonal_left_down_neighbor(center_cell)
    return nil if left_neighbor(center_cell).nil?
    neighbor_array = cells.select do |c|
      (left_neighbor(center_cell).x_coord == c.x_coord) &&
        (left_neighbor(center_cell).y_coord == c.y_coord - 1)
    end
    neighbor_array.first
  end

  def diagonal_right_down_neighbor(center_cell)
    return nil if right_neighbor(center_cell).nil?
    neighbor_array = cells.select do |c|
      (right_neighbor(center_cell).x_coord == c.x_coord) &&
        (right_neighbor(center_cell).y_coord == c.y_coord - 1)
    end
    neighbor_array.first
  end
end
