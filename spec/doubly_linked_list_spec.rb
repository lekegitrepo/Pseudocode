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

    context 'when prepend a node to the list' do
      before { doubly_linked_list.append(8) }

      it 'set the node as the head' do
        prepend_node = doubly_linked_list.prepend(2)
        expect(doubly_linked_list.head.data).to eq prepend_node.data
        expect(doubly_linked_list.tail.data).not_to eq prepend_node.data
      end
    end

    context 'when inserting the first node to the list' do
      before { doubly_linked_list.insert(3) }

      it 'inserts the node to an appropriate position in the list' do
        expect(doubly_linked_list.head.data).to eq 3
        expect(doubly_linked_list.tail.data).to eq 3
      end
    end

    context 'when inserting a node to the list' do
      before { doubly_linked_list.append(6) }

      it 'inserts the node to an appropriate position in the list' do
        linked_list = doubly_linked_list.insert(3)
        expect(doubly_linked_list.head.data).to eq 3
        expect(doubly_linked_list.tail.data).to eq 6
      end
    end

    context 'when searching the list for a node with a specified value' do
      before { doubly_linked_list.append(8) }

      it 'returns the node with specified value' do
        node = doubly_linked_list.find(8)
        expect(doubly_linked_list.head.data).to eq node.data
      end
    end

    context 'when a node is deleted from the list' do
      before { doubly_linked_list.append(8) }

      it 'removes the node' do
        doubly_linked_list.delete(8)
        expect(doubly_linked_list.head).to be_nil
        expect(doubly_linked_list.tail).to be_nil
      end
    end
  end
end

