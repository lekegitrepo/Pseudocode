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
        expect(avl_tree.root.right.left).to be_nil
        expect(avl_tree.root.right.right).to be_nil
      end
    end

    context 'when the tree needs right-left rotation' do
      before { [10, 16, 14].each { avl_tree.insert(_1) } }

      it 'insert the node, changes the root node, and balance the tree' do
        expect(avl_tree.root.data).to eq 10
        avl_tree.insert(15)
        # expect { avl_tree.root }.to change(avl_tree.root.data).from(10).to(10)
        expect(avl_tree.root.data).to eq 14
        expect(avl_tree.root.left.data).to eq 10
        expect(avl_tree.root.left.left).to be_nil
        expect(avl_tree.root.left.right).to be_nil
        expect(avl_tree.root.right.data).to eq 16
        expect(avl_tree.root.right.left.data).to eq 15
      end
    end
  end

  describe '#search' do
    context 'when the value is found' do
      before { [15, 10, 13].each { avl_tree.insert(_1) } }
      it 'returns the value' do
        node = avl_tree.search(10)
        expect(node.data).to eq 10
      end
    end

    context 'when the value is not in the tree' do
      before { [15, 10, 13].each { avl_tree.insert(_1) } }
      it 'returns nil' do
        node = avl_tree.search(8)
        expect(node).to be_nil
      end
    end
  end

  describe 'AVL Traversals' do
    context 'when in-order-traversal' do
      before { [15, 10, 13, 9].each { avl_tree.insert(_1) } }

      it 'returns array with a sorted element' do
        expect(avl_tree.in_order_traversal(avl_tree.root)).to match([9, 10, 13, 15])
      end
    end

    context 'when pre-order-traversal' do
      before { [15, 10, 13, 9].each { avl_tree.insert(_1) } }

      it 'returns array' do
        expect(avl_tree.pre_order_traversal(avl_tree.root)).to match([15, 10, 9, 13])
      end
    end

    context 'when post-order-traversal' do
      before { [15, 10, 13, 9].each { avl_tree.insert(_1) } }

      it 'returns array' do
        expect(avl_tree.post_order_traversal(avl_tree.root)).to match([9, 13, 10, 15])
      end
    end
  end

  describe '#delete' do
    before { [15, 10, 13].each { avl_tree.insert(_1) } }
    context 'when node with the data is in the tree' do
      it 'deletes the node with specified data' do
        expect(avl_tree.root.left.right.data).to eq 13
        avl_tree.delete(13)
        expect(avl_tree.root.data).to eq 15
        node = avl_tree.search(13)
        expect(node).to be_nil
      end
    end
  end
end
