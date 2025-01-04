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
end

