class BeatBox
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end
  
  def append(multi_data)
    multi_data = multi_data.split
    multi_data.each do |data|
      @list.append(data)
    end
  end

  def count
    @list.count
  end

  def play
    
    beats = @list.to_string
    `say -r 100 -v Cellos #{beats}`
    beats
  end
end
# expecting to append multiple nodes at once
# we are receiving a string of multiple sounds
# and we need to split those sounds up to initialize
# one node each. Then, append them together to a linked_list.
# Use Iteration.
# .split method 