class ConwayPolicy
  def process(cell:, neighbors:)
    count = live_neighbor_count(neighbors)
    if !cell.alive
      cell.rebirth if count === 3
    else
      cell.kill if count < 2 || count > 3
    end
  end

  def live_neighbor_count(neighbors)
    neighbors.select { |n| n.alive }.size
  end
end
