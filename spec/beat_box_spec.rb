require "./lib/beat_box"
require "./lib/linked_list"
require "./lib/node"

RSpec.describe BeatBox do
  describe 'initialize' do
    it 'exist' do
      bb = BeatBox.new

      expect(bb).to be_a(BeatBox)
      expect(bb.list).to be_a(LinkedList)
    end
  end

  describe '#append' do
    it 'it can append data' do
      bb = BeatBox.new
      expect(bb.list.head).to be(nil)
      
      bb.append("deep doo ditt")
      expect(bb.list.head).to be_a(Node)

      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")
    end
  end

  describe '#count' do
    it 'can count nodes' do
      bb = BeatBox.new
      bb.append("deep doo ditt")
      bb.append("woo hoo shu")
      
      expect(bb.count).to eq(6)
    end
  end

  describe '#play method' do
    it 'can play sounds' do
      bb = BeatBox.new
      bb.append("deep doo ditt woo hoo shu do")

      expect(bb.count).to eq(7)
      expect(bb.list.count).to eq(7)
      expect(bb.play).to eq("deep doo ditt woo hoo shu do")
    end
  end
end