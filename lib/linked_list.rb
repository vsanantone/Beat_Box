class LinkedList
  attr_reader :head

  def initialize
    @head  = nil
  end

  #One way to solve this method
  # def append(data)
  #   if @head.nil?            
  #     @head = Node.new(data)
  #   else
  #     current_node = @head
  #     while current_node.next_node != nil
  #       current_node = current_node.next_node 
  #     end
  #     current_node.next_node = Node.new(data)
  #   end
  #   data
  # end

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

  #Psuedocode
  # def append(data)
  #   checks if @head is nil
  #   if it is, it will create a new node
  #   else
  #     current_node is the head
  #     while current_node.next_node doesnt equal nil
  #       current_node equals current_node.next_node  #????
  #     end
  #     current_node.next_node equals a new node
  #   end
  #   data is returned
  # end

  def count
    count = 0
    current_node = @head
    while current_node != nil
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  # Psuedocode
  # def count
  #  counting method
  #  count equals zero
  #  while current_node does not equal nil
  #   add one to the counter
  #   the current_node will now equal current_node.next_node
  #  end
  #  return count value
  # end

  def to_string
    string = []
    current_node = @head
    while current_node != nil
      string << current_node.data
      current_node = current_node.next_node
    end
    string.join(" ")
  end

  # Psuedocode
  # def string
  #   we assign string to an empty string
  #   current node equals the head. What does it mean to equal the head???
  #   while the node we are on (current) doesnt equal nill
  #     we are going to shove a one space empty string into the data of the current node
  #     followed into a string format
  #     the current_node will now equal the next node
  #   end
  #   return string.chop
  # end

  def prepend(data)
    new_node = Node.new(data)
    new_node.next_node = @head
    @head = new_node
  end

  # #Pseudocode
  # def prepend(data)
  #   create a new node
  #   if head equals nil
  #     head will equal a new_node
  #   else
  #     new_node.next_node will equal head
  #     Then the head will equal new_node
  #   end
  # end

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

  # def insert(index, data)
  #   set up a counter with a value of 1 or 0
  #   current node equals head
  #   until current_node equals count, add 1 to the count
  #   then, current_node will equal current_node.next_node
  #   end
  #   left_nodes equal current_node
  #   right_nodes equal current_node.next_node
  #   left_nodes.next_node.next_node equals right_nodes 
  # end

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


  # def includes?(data)
  #   current_node = @head
  #   if current_node == data
  #     return true
  #   else
  #     # current_node = current_node.next_node
  #   end
  # end

  def includes?(data)
    current_node = @head
    while current_node
      return true if current_node.data == data
      current_node = current_node.next_node
    end
    false
  end

  # def includes?(data)
  # we are looking for data in the linked list
  # it will first check if there is a head
  # if there is no head it will return false
  # if head matches the data, it will return true
  # if the head doesn't match the date, it will check if the head is
  # pointing to nill or to another node. If it is pointing to another node,
  # it will check if that node matches the data argument, if it does it will
  # return true. If does not, it will return false. It will repeat these
  # steps until it finds the date passed in returning true or until
  # it finishes the list. If it finishes the list and does not find it,
  # it returns false.
    # check if it hits the sound it returns true
    # if it hits the tail and tail does not have the sound
    #   returns false
  # end
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

  # def pop
  #   we are going to check if we have a head. returns nil if there is no head
  #   if there is a head we check if it points to nil or if points to another node.
  #   If nil, we remove the head. If not, we move to the next node.
  #   if next node points to nil, we remove that node, if it points to another node,
  #   we move to that node and repeat the process of checking for nil or another node, until 
  #   we are done with the linked list.

  #   reset the head to nil
  #   make sure to return the data at the end 
  #   end
  # end
end




# class LinkedList
#   attr_reader :head, :counter

#   def initialize
#     @head  = nil
#     @counter = 0
#   end

#   def append(data)
#     @head = Node.new(data) 
#     @counter += 1
#   end

#   def count
#     @counter
#   end

#   def to_string
#     # first get data from head node
#     # ask the code if there a next node or next node nill
#     # if there is, not currently looking at head, next node is now current.
#     # does current node have a next node? answer is no. string complete.
#   end
# end
