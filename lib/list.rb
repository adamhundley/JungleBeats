require_relative '../lib/node'  # => true
class List
  attr_accessor :head           # => nil

  def initialize(data = nil)
    @head = Node.new(data)
  end

  def tail
    temporary_head = @head
    until temporary_head.link == nil
      temporary_head = temporary_head.link
    end
    temporary_head
  end

  def append(data)
    new_node = Node.new(data)
    tail.link = new_node
  end

  def prepend(data)
    temporary_head = @head
    @head = Node.new(data)
    @head.link = temporary_head
  end

  def count
    temporary_head = @head
    count = 1
    until temporary_head.link == nil
      count += 1
      temporary_head = temporary_head.link
    end
    count
  end

  def all
    temporary_head = @head
    beats = ""
    until temporary_head == nil
      beats << temporary_head.data + " "
      temporary_head = temporary_head.link
    end
      beats.chop
  end

  def include?(data)
    temporary_head = @head
    until temporary_head == nil
      return true if temporary_head.data == data
      temporary_head = temporary_head.link
    end
    false
  end

  def insert(position, data)
    count = 0
    temporary_head = @head
    new_node = Node.new(data)

    until count == position
      count += 1
      temporary_head = temporary_head.link
    end
    new_node.link = temporary_head

    count = 0
    temporary_head = @head
    until count == (position - 1)
      count += 1
    temporary_head = temporary_head.link
    end
    temporary_head.link = new_node
  end

  def find(position, amount)
    count = 0
    temporary_head = @head
    found = ""
    until count == position 
      count += 1
      temporary_head = temporary_head.link
    end
      found << temporary_head.data + " "




  end
  # def pop(number)
  #   temporary_head = @head
  #   until temporary_head ==
  # end
end




list = List.new("beep")
list.append("boop")
list.append("pop")
list.append("dirp")

puts list.head.data
puts list.tail.data
puts list.all
