require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    current = @head
    new_tail = Node.new(data)
    if empty?
      @head = new_tail
    else
      tail.next_node = new_tail
    end
    new_tail.data
  end

  def count
    count = 0
    current = @head
    until current == nil
      current = current.next_node
      count +=1
    end
    count
  end

  def to_string
    elements = []
    current = @head
    while current.next_node != nil
      elements << current.data
      current = current.next_node
    end
    elements << current.data
    return elements.join(" ")
  end

  def prepend(data)
    current = Node.new(data)
    current.next_node = @head
    @head = current
  end

  def insert(num, data)
    current = @head
    if num == 0
      prepend(data)
    elsif num < count
      insert_node(current, num, data)
    else
      return "Number provided is longer than list!"
    end
  end

  def find(num1, num2)
    if num1.abs != num1 || num2.abs != num2
      return "Only positive integers!"
    else
      words = to_string.split(" ")
      str = words[num1..num1+num2-1].join(" ")
    end
    str
  end

  def includes(word)
    words = to_string.split(" ")
    words.include?(word)
  end

  def pop
     current = @head
     if empty?
       nil
     elsif count == 1
       @head = nil
       popped = current.data
     else
       pop_returner(current)
     end
     popped
   end

##### helper methods
  def insert_node(current, num, data)
    current = find_node(num, current)
    right_node = current.next_node
    current.next_node = Node.new(data)
    current.next_node.next_node = right_node
  end

  def find_node(num, current)
    (num - 1).times { current = current.next_node }
    current
  end

  def tail
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end
    current
  end

  def empty?
    @head == nil
  end

  def pop_returner(current)
    while current.next_node.next_node != nil
      current = current.next_node
    end
    popped = current.next_node.data
    current.next_node = nil
    return popped
  end
end
