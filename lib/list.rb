require_relative '../lib/node'  # => true
class List
  attr_accessor :head           # => nil

  def initialize(data = nil)
    @head = Node.new(data)

  end

  def tail
    current_node = @head
    until current_node.link == nil
      current_node = current_node.link
    end
    current_node
  end

  def append(data)
    new_node = Node.new(data)
    tail.link = new_node
  end

  def prepend(data)
    current_node = @head
    @head = Node.new(data)
    @head.link = current_node
  end

  def count
    current_node = @head
    count = 1
    until current_node.link == nil
      count += 1
      current_node = current_node.link
    end
    count
  end

  def all
    current_node = @head
    beats = ""
    until current_node == nil
      beats << current_node.data + " "
      current_node = current_node.link
    end
      beats.chop
  end

  def include?(data)
    current_node = @head
    until current_node == nil
      return true if current_node.data == data
      current_node = current_node.link
    end
    false
  end

  def insert(position, data)
    count = 0
    current_node = @head
    new_node = Node.new(data)

    until count == position
      count += 1
      current_node = current_node.link
    end
    new_node.link = current_node

    count = 0
    current_node = @head
    until count == (position - 1)
      count += 1
    current_node = current_node.link
    end
    current_node.link = new_node
  end

  def find(position, amount)
    count = 0
    current_node = @head
    until count == position
      count += 1
      current_node = current_node.link
    end

    found = ""
    amount.times do
      found << current_node.data + " "
      current_node = current_node.link
    end
    found.chop
  end

  def pop(amount = 1)  
    popped = []
    amount.times do
      current_node = @head
      until current_node.link.link == nil
        current_node = current_node.link
      end
        popped << current_node.link.data + " "
        current_node.link = nil
    end
    popped.reverse.join.chop
  end
end
