require_relative '../lib/policies/conway_policy'

describe ConwayPolicy do
  let(:center_cell_dead) { instance_double('Cell', alive: false) }
  let(:center_cell_alive) { instance_double('Cell', alive: true) }
  let(:live_cell_1) { instance_double('Cell', alive: true) }
  let(:live_cell_2) { instance_double('Cell', alive: true) }
  let(:live_cell_3) { instance_double('Cell', alive: true) }
  let(:live_cell_4) { instance_double('Cell', alive: true) }
  let(:conway_policy) { ConwayPolicy.new }


  describe '#process' do
    context 'dead cell' do
      it 'gets a rebirth with exactly three live neighbors' do
        allow(center_cell_dead).to receive(:rebirth)
        conway_policy.process(
          cell: center_cell_dead,
          neighbors: [ live_cell_1, live_cell_2, live_cell_3 ]
        )

        expect(center_cell_dead).to have_received(:rebirth)
      end
    end

    context 'live cell' do
      it 'gets killed with less than two live neighbors' do
        allow(center_cell_alive).to receive(:kill)
        conway_policy.process(
          cell: center_cell_alive,
          neighbors: [ ]
        )

        expect(center_cell_alive).to have_received(:kill)
      end

      it 'gets killed with more than three live neighbors' do
        allow(center_cell_alive).to receive(:kill)
        conway_policy.process(
          cell: center_cell_alive,
          neighbors: [ live_cell_1, live_cell_2, live_cell_3, live_cell_4 ]
        )

        expect(center_cell_alive).to have_received(:kill)
      end
    end
  end
end
