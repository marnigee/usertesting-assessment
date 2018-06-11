class ConwayPolicy
  def evaluate_cells(cell:, neighbors:)
    @cells_to_rebirth ||= []
    @cells_to_kill ||= []
    count = live_neighbor_count(neighbors)
    if !cell.alive
      @cells_to_rebirth << cell if count == 3
    else
      @cells_to_kill << cell if count < 2 || count > 3
    end
  end

  def update_cells
    @cells_to_rebirth.map(&:rebirth)
    @cells_to_kill.map(&:kill)
  end

  def live_neighbor_count(neighbors)
    return 0 if neighbors.nil?
    neighbors.select { |n| n&.alive }.size
  end
end
