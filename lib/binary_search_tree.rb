# frozen_string_literal: true

# BinarySearchTree
class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
    @collection = []
  end

  def insert(key)
    if root.nil?
      @root = Node.new(key)
    else
      @root.insert(key)
    end
  end

  def in_order(node = @root, &block)
    return if node.nil?

    in_order(node.left, &block)
    yield(node)
    in_order(node.right, &block)
  end

  def pre_order(node = @root, &block)
    return if node.nil?

    yield node
    in_order(node.left, &block)
    in_order(node.right, &block)
  end

  def post_order(node = @root, &block)
    return if node.nil?

    in_order(node.left, &block)
    in_order(node.right, &block)
    yield node
  end

  # def bst_is_valid?(node, min = -1.0 / 0.0, max = 1.0 / 0.0)
  #   until node.left.nil? && node.right.nil?
  #     return false if min > node.value || max < node.root_value
  #
  #     BST_is_valid?(node.left, min, node.value)
  #     BST_is_valid?(node.right, node.value, max)
  #     return true
  #   end
  # end
  #
  # def search(value, node)
  #   return nil if node.nil?
  #   return node if value == node.value
  #
  #   if value > node.value
  #     search(value, node.right)
  #   elsif value < node.value
  #     search(value, node.left)
  #   end
  # end
  #
  # def delete(value)
  #   node = search(value)
  #   remove(node) unless node.nil?
  # end
  #
  # def remove(node)
  #   node =
  #     if node.left.nil? && node.right.nil?
  #       nil
  #     elsif !node.left.nil? && node.right.nil?
  #       node.left
  #     elsif node.left.nil? && !node.right.nil?
  #       node.right
  #     else
  #       delete_node_with_two_children(node)
  #     end
  #   node
  # end
  #
  # def delete_node_with_two_children(node)
  #   min_node = find_min_node(node.right)
  #   replace_value(min_node, node)
  #   remove_min_node(min_node)
  # end
  #
  # def find_min_node(node)
  #   if node.left.nil?
  #     min_node = node
  #     min_node
  #   else
  #     find_min(node.left)
  #   end
  # end
  #
  # def replace_value(min_node, node)
  #   node.value = min_node.value
  # end
  #
  # def remove_min_node(min_node)
  #   min_node = nil
  # end
end
