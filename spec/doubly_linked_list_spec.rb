require_relative '../implementation/doubly_linked_list.rb'

RSpec.describe 'Doubly-LinkedList' do
  let(:node) { Node.new(1) }

  describe 'Node' do
    context 'when a Node is initialized' do
      it 'set the data value' do
        expect(node.next).to be_nil
        expect(node.prev).to be_nil
        expect(node.data).to eq 1
      end
    end
  end

  describe 'DoublyLinkedList' do
    let(:doubly_linked_list) { DoublyLinkedList.new }

    context 'when the first node is appended to the list' do
      before { doubly_linked_list.append(4) }
      it 'set the head and the tail to the only node' do
        expect(doubly_linked_list.head.data).to eq 4
        expect(doubly_linked_list.tail.data).to eq 4
      end
    end

    context 'when the node is prepend to the list' do
      it 'set the node as the tail' do
      end
    end
  end
end

