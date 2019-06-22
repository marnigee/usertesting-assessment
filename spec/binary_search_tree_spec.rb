require 'pry-rails'

require_relative '../lib/binary_search_tree'
require_relative '../lib/node'

describe BinarySearchTree do
  let (:bns) { BinarySearchTree.new }

  it 'has initial nil root' do
    expect(bns.root).to be_nil
  end

  context '#insert' do
    it 'inserts a root node' do
      bns.insert(10)

      expect(bns.root.left).to be_nil
      expect(bns.root.right).to be_nil
      expect(bns.root.key).to eq(10)
    end

    it 'inserts a left node' do
      bns.insert(10)
      bns.insert(9)

      expect(bns.root.right).to be_nil
      expect(bns.root.left.key).to eq(9)
    end

    it 'inserts a right node' do
      bns.insert(10)
      bns.insert(11)

      expect(bns.root.left).to be_nil
      expect(bns.root.right.key).to eq(11)
    end
  end

  context '#in_order' do
    it 'puts keys in order' do
      bns.insert(10)
      bns.insert(9)
      bns.insert(11)

      expect {
        bns.in_order { |n| puts n.key }
      }.to output("9\n10\n11\n").to_stdout
    end
  end

  context '#pre_order' do
    it 'puts keys pre order' do
      bns.insert(10)
      bns.insert(9)
      bns.insert(11)

      expect {
        bns.pre_order { |n| puts n.key }
      }.to output("10\n9\n11\n").to_stdout
    end
  end

  context '#post_order' do
    it 'puts keys post order' do
      bns.insert(10)
      bns.insert(9)
      bns.insert(11)

      expect {
        bns.post_order { |n| puts n.key }
      }.to output("9\n11\n10\n").to_stdout
    end
  end
end
