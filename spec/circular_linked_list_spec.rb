require_relative '../implementation/circular_linked_list.rb'

RSpec.describe 'CircularLinkedList' do
  let(:circular_linked_list) { CircularLinkedList.new }

  context 'when first node is appended to the list' do
    before { circular_linked_list.append(8) }

    it 'points the head to the new node and points the node.next to the head' do
      expect(circular_linked_list.head.data).to eq 8
      expect(circular_linked_list.head.next.data).to eq 8  
    end
  end

  context 'when a new node is appended to a list with already existing nodes' do
    before { [2, 3, 6, 9, 16].each { circular_linked_list.append(_1) } }
    it 'points the new node.next to the head' do
      node = circular_linked_list.append(18)
      expect(node.data).to eq 18
      expect(node.next).to eq circular_linked_list.head
      expect(node.next.data).to eq circular_linked_list.head.data
      expect(circular_linked_list.head.next.data).to eq 3
    end
  end
end
