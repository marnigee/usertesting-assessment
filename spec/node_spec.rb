require_relative '../lib/node'

describe Node do
  let(:node_with_nil_key) { Node.new(nil) }
  let(:node) { Node.new(10) }

  context 'without value argument' do
    it 'applies nil value' do
      expect(node_with_nil_key.key).to be_nil
    end
  end

  context '#insert' do
    it 'sets root key' do
      expect(node.key).to eq(10)
    end
    it 'sets left key' do
      node.insert(9)

      expect(node.right).to eq(nil)
      expect(node.left.key).to eq(9)
    end
    it 'sets right key' do
      node.insert(11)

      expect(node.left).to eq(nil)
      expect(node.right.key).to eq(11)
    end
  end
end
