require 'pry'

Node = Struct.new(:value, :next_node)

class LinkedList
  include Enumerable
  attr_accessor :data_list

  def initialize
    @data_list = nil
  end

  def create_new_node(value)
    Node.new(value, nil)
  end

  def append(value)
    node = create_new_node(value)
    if data_list.nil?
      @data_list = node
    else
      append_aux(data_list, node)
    end
  end

  def prepend(value)
    node = Node.new(value, data_list)
    @data_list = node
    p data_list
  end

  def size
    p size_aux(data_list)
  end

  def head
    p data_list.value
  end

  def tail
    p tail_aux(data_list)
  end

  def at(index)
    p at_aux(data_list, index)
  end

  def pop
    p pop_aux(data_list).next_node
    pop_aux(data_list).next_node = nil
  end

  def contain?(element)
    p contain_aux(data_list, element)
  end

  def find(element)
    p find_aux(data_list, element)
  end

  def to_s
    values_array = to_s_aux(data_list).reverse << 'nil'
    p values_array.join(" -> ")
  end

  def insert_at(index, val)
    new_node = create_new_node(val)
    insert_at_aux(data_list, index, new_node)
    p data_list
  end

  def remove_at(index)
    remove_at_aux(data_list, index)
    p data_list
  end

  def each (&block)
    each_aux(data_list, block).reverse
  end

  private

  def append_aux(current_node, new_node)
    return current_node.next_node = new_node if current_node.next_node.nil?
    append_aux(current_node.next_node, new_node)
  end

  def size_aux(current_node)
    return 0 if current_node.nil?
    count = size_aux(current_node.next_node)
    count + 1
  end

  def tail_aux(current_node)
    return current_node.value if current_node.next_node.nil?
    tail_aux(current_node.next_node)
  end

  def at_aux(current_node, index)
    return current_node.value if index == 1
    at_aux(current_node.next_node, index - 1)
  end

  def pop_aux(current_node)
    return current_node if current_node.next_node.next_node.nil?
    pop_aux(current_node.next_node)
  end

  def contain_aux(current_node, element)
    return true if current_node.value == element
    return false if current_node.value != element && current_node.next_node == nil
    contain_aux(current_node.next_node, element)
  end

  def find_aux(current_node, element, count=0)
    return count if current_node.value == element
    return nil if current_node != element && current_node.next_node == nil
    find_aux(current_node.next_node, element, count + 1)
  end

  def to_s_aux(current_node)
    return [current_node.value] if current_node.next_node == nil
     values_array = to_s_aux(current_node.next_node)
     values_array << current_node.value
     return values_array
  end

  def insert_at_aux(current_node, index, node)
    if index == 0
      node.next_node = current_node
      @data_list = node
      return
    end
    if index == 1
      node.next_node = current_node.next_node
      current_node.next_node = node
      return
    end
    if current_node == nil
      puts "no such index, sorry"
      return
    end
    insert_at_aux(current_node.next_node, index - 1, node)
  end

  def remove_at_aux(current_node, index)
    if index == 0
      puts "node with value #{current_node.value} was removed"
      @data_list = current_node.next_node
      return
    end
    if index == 1
      puts "node with value #{current_node.next_node.value} was removed"
      current_node.next_node = current_node.next_node.next_node
      return
    end
  if current_node == nil
    puts "no such index, sorry"
    return
  end
    remove_at_aux(current_node.next_node, index - 1)
  end

  def each_aux(current_node, block)
    return [block.call(current_node.value)] if current_node.next_node == nil
     values_array = each_aux(current_node.next_node, block)
     values_array << block.call(current_node.value)
     return values_array
  end
end

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.prepend(6)
list.size
list.head
list.tail
list.at(3)
list.pop
p list.data_list
list.contain?(8)
list.find(3)
list.to_s
list.insert_at(2, 8)
list.remove_at(1)
p list.each { |el| el * 2 }
p list.all? {|el| el > 4 }
p list.max
p list.sort
