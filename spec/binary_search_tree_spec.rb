require_relative '../implementation/binary_search_tree.rb'

RSpec.describe 'Binary Search Tree' do
  let(:bst) { BST.new }

  describe 'Inserting nodes' do
    before { bst.insert(20) }

    context 'when new node is inserted' do
      let(:bst_root) { BST.new }

      before { bst_root.insert(8)}

      it 'inserts the node' do
        expect(bst_root.root.data).to eq 8  
      end
    end

    context 'when a node is inserted with less value than root' do
      before { bst.insert(10) }

      it 'inserts the node as the left child' do
        expect(bst.root.left.data).to eq 10
      end
    end

    context 'when a node is inserted with greater value than root' do
      before { bst.insert(30) }

      it 'inserts the node as the right child' do
        expect(bst.root.right.data).to eq 30
      end
    end
  end

  describe 'Searching for a node' do
    before { bst.insert(20) }

    context 'when a node is found' do
      it 'returns the node' do
        node = bst.search(20)
        expect(node.data).to eq 20
      end
    end

    context 'when a node is not found' do
      it 'returns null' do
        node = bst.search(24)
        expect(node).to be_nil
      end
    end
  end

  describe 'Traversing the binary tree' do
    before { [5, 6, 3, 16, 12, 8].each { bst.insert(_1) } }

    context 'when the tree is traverse using in_order_traversal' do
      it 'returns the values in sorted order' do
        in_order_traversal = bst.in_order_traversal(bst.root, [])
        expect(in_order_traversal).to match([3, 5, 6, 8, 12, 16])
      end
    end
  end
end

