require_relative '../implementation/avl_tree.rb'

RSpec.describe 'AVL Tree' do
  let(:avl_tree) { AVLTree.new }

  describe '#insert' do
    context 'when tree is already balanced' do
      before { [20, 18, 24].each { avl_tree.insert(_1) } }

      it 'inserts to the right subtree' do
        avl_tree.insert(29)
        expect(@root.data).to eq 20
        expect(@root.left.data).to eq 18
        expect(@root.right.data).to eq 24
        expect(@root.right.right.data).to eq 29
      end
    end

    context 'when the tree needs left rotation' do
      before { [8, 15, 17].each { avl_tree.insert(_1) } }

      it 'changes the root node, balance the tree and insert the node' do
        expect(@root.data).to eq 8
        avl_tree.insert(28)
        # expect { @root }.to change(@root.data).from(8).to(15)
        expect(@root.data).to eq 15
      end
    end

    context 'when the tree needs right rotation' do
    end

    context 'when the tree needs left-right rotation' do
    end

    context 'when the tree needs right-left rotation' do
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
