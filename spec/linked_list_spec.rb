require "./lib/linked_list"
require "./lib/node"

RSpec.describe LinkedList do
  describe 'initialize' do
    it 'exist' do
      list = LinkedList.new
      expect(list).to be_a(LinkedList)
    end

    it '#has an empty head by default' do
      list = LinkedList.new
      expect(list.head).to eq(nil)
    end
  end

  describe '#append' do
    it 'can append a node' do
      list = LinkedList.new
      expect(list.head).to eq(nil)

      list.append("doop")
      expect(list.head).to be_a(Node)
      expect(list.head.data).to eq("doop")
      expect(list.head.next_node).to eq(nil) ##???

      list.append("deep")
      # expect(list.head.next_node).to be_a(Node) ##???
      expect(list.tail).to be_a(Node) ##???
      # expect(list.head.next_node.data).to eq('deep')
      expect(list.tail.data).to eq("deep")
      # expect(list.head.next_node.next_node).to eq(nil)

      list.append("dop")
      expect(list.head.next_node.next_node).to be_a(Node) ##???
      # expect(list.head.next_node.next_node.data).to eq('dop')
      expect(list.tail.data).to eq("dop")
      # expect(list.head.next_node.next_node.next_node).to eq(nil)
    end
  end

  describe '#tail' do
    it 'returns the tail of the linked_list ' do
      list = LinkedList.new
      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)

      list.append("doop")
      expect(list.tail).to be_a(Node)
      expect(list.tail.data).to eq("doop")
      expect(list.tail.next_node).to eq(nil)
      expect(list.tail).to eq(list.head)

      list.append("deep")
      expect(list.tail.data).to eq("deep")
      expect(list.tail.next_node).to eq(nil)

      list.append("dop")
      expect(list.tail.data).to eq("dop")
      expect(list.tail.next_node).to eq(nil)
    end
  end
  

  describe '#count' do
    it 'can count nodes' do
      list = LinkedList.new
      expect(list.count).to eq(0)

      list.append("doop")
      expect(list.count).to eq(1)

      list.append("deep")
      expect(list.count).to eq(2)

      list.append("plop")
      expect(list.count).to eq(3)

      list.prepend("dop")
      expect(list.count).to eq(4)

      list.insert(1, "woo")
      expect(list.count).to eq(5)

    end
  end

  describe '#to_string' do
    it 'returns @data for every node#1' do
      list = LinkedList.new
      list.append("doop")
      expect(list.to_string).to eq("doop")

      list.append("deep")
      expect(list.to_string).to eq("doop deep")
    end
  end

  describe '#prepend' do
    it 'can prepend a node' do
      list = LinkedList.new
      list.append("plop")
      expect(list.head.data).to eq("plop")
      expect(list.to_string).to eq("plop")

      list.append("suu")
      expect(list.to_string).to eq("plop suu")
      expect(list.head.data).to eq("plop")

      list.prepend("dop")
      expect(list.head.data).to eq("dop")
      expect(list.to_string).to eq("dop plop suu")
    end
  end

  describe '#insert' do
    it 'can insert a node at a given index' do
      list = LinkedList.new
      list.append("plop")
      expect(list.to_string).to eq("plop")

      list.append("suu")
      expect(list.to_string).to eq("plop suu")

      list.prepend("dop")
      expect(list.to_string).to eq("dop plop suu")

      list.insert(1, "woo")
      expect(list.to_string).to eq("dop woo plop suu")
    end
  end

  describe '#find' do
    it 'can find a node at a given index' do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.to_string).to eq("deep woo shi shu blop")
      expect(list.find(2,1)).to eq("shi")
      expect(list.find(1,3)).to eq("woo shi shu")
    end
  end

  describe '#includes?' do
    it "includes specific data" do
      list = LinkedList.new
      expect(list.includes?("deep")).to eq(false)

      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.includes?("deep")).to eq(true)
      expect(list.includes?("dep")).to eq(false)
      # Extra edgecase test
      expect(list.includes?("blop")).to eq(true)

    end
  end

  describe '#pop' do
    it 'can remove the last node in the list' do
      list = LinkedList.new
      expect(list.pop).to eq(nil)

      list.append("deep")
      expect(list.pop).to eq("deep")

      list.append("deep")
      list.append("woo")
      expect(list.pop).to eq("woo")

      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.pop).to eq("blop")
      expect(list.pop).to eq("shu")
      expect(list.to_string).to eq("deep woo shi")

    end
  end

end

  
      