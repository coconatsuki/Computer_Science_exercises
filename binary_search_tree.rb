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
    node = breadth_first_search_aux(@tree, val)
    return nil if node.nil?
    puts "\nnode's'value : #{node.value}"
    puts "parent's value : #{node.parent.value}" if node.parent
    puts "left_child's value : #{node.left_child.value}" if node.left_child
    puts "right_child's value : #{node.right_child.value}" if node.right_child
    puts "no child" if !(node.left_child && node.right_child)
    node
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
      node.parent = root
      return
    elsif root.value > node.value && root.left_child.nil?
      root.left_child = node
      node.parent = root
      return
    end
    if root.value < node.value && root.right_child
      add_one_value(root.right_child, node)
    elsif root.value > node.value && root.left_child
      add_one_value(root.left_child, node)
    end
  end

  def breadth_first_search_aux(root, val)
    return root if root.value == val
    queue = []
    queue << root.left_child if root.left_child
    queue << root.right_child if root.right_child
    while !queue.empty?
      queue.each do |el|
        if el.value == val
          return el
          break
        else
          queue << el.left_child if el.left_child
          queue << el.right_child if el.right_child
        end
        queue.delete(el)
      end
    end
    nil
  end
end

builder = Builder.new
builder.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
builder.breadth_first_search(23)

#builder.breadth_first_search(val)

#left = breadth_first_search_aux(root.left_child, val)
#right = breadth_first_search_aux(root.right_child, val)


#Build a method breadth_first_search which takes a target value and returns the node
#at which it is located using the breadth first search technique.
#Tip: You will want to use an array acting as a queue
#to keep track of all the child nodes that you have yet to search
#and to add new ones to the list (as you saw in the video).
#If the target node value is not located, return nil.
