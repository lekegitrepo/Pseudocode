require_relative '../implementation/avl_tree.rb'

RSpec.describe 'AVL Tree' do
  let(:avl_tree) { AVLTree.new }

  describe '#insert' do
    before { [20, 18, 24].each {avl_tree.insert(_1) } }

    context 'when tree is already balanced' do
      before { avl_tree.insert(29)}

      it 'insert to the right subtree' do
        expect(@root.data).to eq 20
        expect(@root.left.data).to eq 18
        expect(@root.right.data).to eq 24
        expect(@root.right.right.data).to eq 29
      end
    end
  end

  describe '#search' do
    context 'when tree is already balanced' do
      it 'returns the value' do
      end
    end
  end

  describe '#delete' do
    context 'when tree is already balanced' do
      it 'deletes the node with specified data' do
      end
    end
  end
end
