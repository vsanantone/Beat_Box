class LinkedList
  attr_reader :head

  def initialize
    @head  = nil
  end

  def append(data)
    if @head.nil?      
      @head = Node.new(data)
    else
      tail.next_node = Node.new(data)
    end
    data
  end

  def tail
    return nil if @head.nil?
    current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node 
      end
    current_node
  end

  def count
    count = 0
    current_node = @head
    while current_node != nil
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def to_string
    string = []
    current_node = @head
    while current_node != nil
      string << current_node.data
      current_node = current_node.next_node
    end
    string.join(" ")
  end

  def prepend(data)
    new_node = Node.new(data)
    new_node.next_node = @head
    @head = new_node
  end

  def insert(index, data)
    count = 1
    current_node = @head
    until index == count
      count += 1
      current_node = current_node.next_node
    end
    left_nodes = current_node
    right_nodes = current_node.next_node
    left_nodes.next_node = Node.new(data)
    left_nodes.next_node.next_node = right_nodes
  end

  def find(index, quantity)
    iterator = 0
    string = ""
    current_node = @head
    until iterator == index
      iterator += 1
      current_node = current_node.next_node
    end
    until iterator == index + quantity
      string << current_node.data << " "
      current_node = current_node.next_node
      iterator += 1
    end
    string.strip
  end

  def includes?(data)
    current_node = @head
    while current_node
      return true if current_node.data == data
      current_node = current_node.next_node
    end
    false
  end

  def pop
    # you need to set (tail - 1)'s @next_node to nil
    return nil if @head.nil?
    data = tail.data
    if @head == tail
      @head = nil
      return data
    end
    current_node = @head
    while current_node.next_node != tail
      current_node = current_node.next_node 
    end
    current_node.next_node = nil
    data
  end

end
