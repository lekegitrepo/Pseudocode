require_relative '../implementation/singly_linked_list.rb'

RSpec.describe 'Singly-LinkedList' do
  let(:node) { Node.new(6) }

  describe 'Node' do
    context 'when initialized with a value' do
      it 'returns the value of the data stored' do
        expect(node.data).to eq 6
      end

      it 'returns the nil for the node.next' do
        expect(node.next).to be_nil
      end
    end
  end

  describe 'LinkedList' do
    let(:linked_list) { LinkedList.new }

    context 'when the head pointer is nil' do

      it 'returns nil for head' do
        expect(linked_list.head).to be_nil
      end
    end

    context 'when the head points to a node' do
      before { linked_list.append(18) }


      it 'returns a valid value for the node' do
        head = linked_list.head
        expect(head.data).to eq 18
      end

      it 'returns nil for pointer to the next node' do
        head = linked_list.head
        expect(head.next).to be_nil
      end
    end

    context 'when a new node is appended to the linked-list' do
      before do
        linked_list.append(2)
        linked_list.append(6)
      end

      it 'returns the appended value from the next node' do
        added_node = linked_list.head.next
        expect(added_node.data).to eq 6
        expect(linked_list.head.next).not_to be_nil
      end
    end

    context 'when a new node is inserted into the middle of the linked-list' do
      before do
        [4, 6, 8, 15, 28].each { linked_list.append(_1) }
        linked_list.insert(20)
      end

      it 'insert a new node' do
        node = linked_list.find(20)
        expect(node.data).to eq 20
      end
    end

    context 'when searching for a value in the linked_list' do
      before do
        [4, 6, 8, 15, 28].each { linked_list.append(_1) }
      end

      context 'when the value is in the linked_list' do
  
        it 'found and returns the value' do
          node = linked_list.find(28)
          expect(node.data).to eq 28
        end
      end

      context 'when the value is not in the linked_list' do
        it 'returns nil' do
          node = linked_list.find(30)
          expect(node).to be_nil
        end
      end
    end

    context 'when a node is deleted from the linked-list' do
      before do
        [4, 6, 8, 15, 28].each { linked_list.append(_1) }
        linked_list.delete(8)
      end

      it 'returns nil for the deleted value' do
        node = linked_list.find(8)
        p node
        expect(node).to be_nil
      end
    end
  end
end

