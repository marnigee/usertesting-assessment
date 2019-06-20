# frozen_string_literal: true

# Node in Binary Tree
class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value = nil)
    @value = value
    left = nil
    right = nil
  end
end
