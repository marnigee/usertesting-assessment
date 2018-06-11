require_relative '../lib/cell_neighbors'

describe CellNeighbors do
  let(:center_cell) { instance_double('Cell', x_coord: 2, y_coord: 2) }
  let(:left) { instance_double('Cell', x_coord: 1, y_coord: 2) }
  let(:right) { instance_double('Cell', x_coord: 3, y_coord: 2) }
  let(:up) { instance_double('Cell', x_coord: 2, y_coord: 1) }
  let(:down) { instance_double('Cell', x_coord: 2, y_coord: 3) }
  let(:diagonal_right_down) { instance_double('Cell', x_coord: 3, y_coord: 3) }
  let(:diagonal_right_up) { instance_double('Cell', x_coord: 3, y_coord: 1) }
  let(:diagonal_left_down) { instance_double('Cell', x_coord: 1, y_coord: 3) }
  let(:diagonal_left_up) { instance_double('Cell', x_coord: 1, y_coord: 1) }

  let(:neighbors) {
    [
      left,
      right,
      up,
      down,
      diagonal_right_down,
      diagonal_right_up,
      diagonal_left_down,
      diagonal_left_up,
    ]
  }
  let(:all_game_cells) { neighbors << center_cell }
  let(:cell_neighbors) {
    CellNeighbors.new(
      cells: all_game_cells
    )
  }

  context 'missing neighbors' do
    it 'it returns nil if there is no neighbor' do
      cell_without_all_neighbors = left
      expect(
        cell_neighbors.neighbors(cell_without_all_neighbors)
      ).to include(nil)
    end
  end

  context 'all neighbors' do
    it 'gets eight neighbors' do
      expect(
        cell_neighbors.neighbors(center_cell).size
      ).to eq(8)
    end

    it 'gets left neighbor' do
      expect(
        cell_neighbors.neighbors(center_cell)
      ).to include(left)
    end

    it 'gets right neighbor' do
      expect(
        cell_neighbors.neighbors(center_cell)
      ).to include(right)
    end

    it 'gets up neighbor' do
      expect(
        cell_neighbors.neighbors(center_cell)
      ).to include(up)
    end

    it 'gets down neighbor' do
      expect(
        cell_neighbors.neighbors(center_cell)
      ).to include(down)
    end

    it 'gets diagonal_right_down neighbor' do
      expect(
        cell_neighbors.neighbors(center_cell)
      ).to include(diagonal_right_down)
    end

    it 'gets down diagonal_right_up neighbor' do
      expect(
        cell_neighbors.neighbors(center_cell)
      ).to include(diagonal_right_up)
    end

    it 'gets diagonal_left_down neighbor' do
      expect(
        cell_neighbors.neighbors(center_cell)
      ).to include(diagonal_left_down)
    end

    it 'gets diagonal_left_up neighbor' do
      expect(
        cell_neighbors.neighbors(center_cell)
      ).to include(diagonal_left_up)
    end
  end
end
