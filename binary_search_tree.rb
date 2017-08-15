require 'pry'

class Node

  attr_accessor :value, :parent, :left_child, :right_child

  def initialize (value)
    @value = value
  end
end

class Builder

    attr_accessor :tree

  def initialize
    @tree = nil
  end

  def build_tree(data_array)
    array = data_array.shuffle.map { |el| Node.new(value = el) }
    p array[0]
    array.each { |el| add_one_value(@tree, el) }
    binding.pry
    p @tree
  end

  private

  def add_one_value(root, node)
    if root.nil?
      root = node
      @tree = root
      return
    end
    if root.value < node.value && root.right_child.nil?
      root.right_child = node
      return
    elsif root.value > node.value && root.left_child.nil?
      root.left_child = node
      return
    end
    if root.value < node.value && root.right_child
      pseudo_root = add_one_value(root.right_child, node)
    elsif root.value > node.value && root.left_child
      pseudo_root = add_one_value(root.left_child, node)
    end
  end
end

builder = Builder.new
builder.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
