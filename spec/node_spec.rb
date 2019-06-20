require_relative '../lib/Node'

describe Node do
  let(:node) { Node.new }
  let(:node_with_value_arg) { Node.new(1) }

  context 'without value argument' do
    it 'applies nil value' do
      expect(node.value).to be_nil
    end
  end

  context 'with value argument' do
    it 'applies nil value' do
      expect(node_with_value_arg.value).to eq(1)
    end
  end
end
