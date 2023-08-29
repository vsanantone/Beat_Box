require './lib/node'

RSpec.describe Node 
  describe 'initialize' do
    it 'exist' do
      node = Node.new("plop")
  
      expect(node).to be_a (Node)
    end

  describe "has readable attributes" do
    it 'has a name' do
      node = Node.new("plop")
  
      expect(node.data).to eq ("plop")
    end
  end

  describe '#next_node' do
    it 'starts with pointing to no Node' do
      node = Node.new("plop")

      expect(node.next_node).to eq (nil)
    end
  end
end
