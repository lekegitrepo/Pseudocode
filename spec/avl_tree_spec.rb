require_relative '../implementation/avl_tree.rb'

RSpec.describe 'AVL Tree' do
  let(:avl_tree) { AVLTree.new }

  describe '#insert' do
    context 'when tree is already balanced' do
      before { [20, 18, 24].each { avl_tree.insert(_1) } }

      it 'inserts to the right subtree' do
        avl_tree.insert(29)
        expect(avl_tree.root.data).to eq 20
        expect(avl_tree.root.left.data).to eq 18
        expect(avl_tree.root.right.data).to eq 24
        expect(avl_tree.root.right.right.data).to eq 29
      end
    end

    context 'when the tree needs left rotation' do
      before { [8, 15, 17].each { avl_tree.insert(_1) } }

      it 'insert the node, changes the root node, and balance the tree' do
        expect(avl_tree.root.data).to eq 8
        avl_tree.insert(28)
        # expect { avl_tree.root }.to change(avl_tree.root.data).from(8).to(15)
        expect(avl_tree.root.data).to eq 15
      end
    end

    context 'when the tree needs right rotation' do
      before { [10, 8, 5].each { avl_tree.insert(_1) } }

      it 'insert the node, changes the root node, and balance the tree' do
        expect(avl_tree.root.data).to eq 10
        avl_tree.insert(2)
        # expect { avl_tree.root }.to change(avl_tree.root.data).from(10).to(10)
        expect(avl_tree.root.data).to eq 8
      end
    end

    context 'when the tree needs left-right rotation' do
      before { [15, 10, 13].each { avl_tree.insert(_1) } }

      it 'insert the node, changes the root node, and balance the tree' do
        expect(avl_tree.root.data).to eq 15
        avl_tree.insert(12)
        # expect { avl_tree.root }.to change(avl_tree.root, :data).from(15).to(13)
        expect(avl_tree.root.data).to eq 13
        expect(avl_tree.root.height).to eq 2
        expect(avl_tree.root.left.right.data).to eq 12
        expect(avl_tree.root.right.data).to eq 15
      end
    end

    context 'when the tree needs right-left rotation' do
      before { [10, 16, 5].each { avl_tree.insert(_1) } }

      it 'insert the node, changes the root node, and balance the tree' do
        expect(avl_tree.root.data).to eq 10
        avl_tree.insert(2)
        # expect { avl_tree.root }.to change(avl_tree.root.data).from(10).to(10)
        expect(avl_tree.root.data).to eq 16
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
