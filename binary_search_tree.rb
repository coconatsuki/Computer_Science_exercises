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
    p @tree
  end

  def breadth_first_search(val)
    node = breadth_first_search_aux(val)
    print_node_details(node, val)
    node
  end

  def depth_first_search_recursive(val)
    node = depth_first_search_recursive_aux(@tree, val)
    print_node_details(node, val)
    node
  end

  private

  def print_node_details(node, val)
    if node.nil?
      puts "\nThere's no node with a value of #{val} in the tree"
    else
      puts "\nnode's'value : #{node.value}"
      puts "parent's value : #{node.parent.value}" if node.parent
      puts "left_child's value : #{node.left_child.value}" if node.left_child
      puts "right_child's value : #{node.right_child.value}" if node.right_child
      puts "no child" if !(node.left_child && node.right_child)
      node
    end
  end

  def add_one_value(root, node)
    if root.nil?
      root = node
      @tree = root
      return
    end
    if root.value >= node.value && root.left_child.nil?
      root.left_child = node
      node.parent = root
      return
    elsif root.value <= node.value && root.right_child.nil?
      root.right_child = node
      node.parent = root
      return
    end
    if root.value >= node.value && root.left_child
      add_one_value(root.left_child, node)
    elsif root.value <= node.value && root.right_child
      add_one_value(root.right_child, node)
    end
  end

  def breadth_first_search_aux(val)
    queue = [@tree]
    while !queue.empty?
      if queue[0].value == val
        return queue[0]
        break
      else
        queue << queue[0].left_child if queue[0].left_child
        queue << queue[0].right_child if queue[0].right_child
        queue.shift
      end
    end
    nil
  end

  def depth_first_search_recursive_aux(root, val)
    return nil if root == nil
    return root if root.value == val
    depth_first_search_recursive_aux(root.left_child, val) ||
    depth_first_search_recursive_aux(root.right_child, val)
  end
end

builder = Builder.new
builder.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
builder.breadth_first_search(23)
builder.depth_first_search_recursive(67)
