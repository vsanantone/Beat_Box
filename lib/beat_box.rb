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
