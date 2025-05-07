require_relative '..implementation/tries'

RSpec.describe TrieNode do
  subject(:trie_node) { described_class.new }

  describe '#insert' do
    context 'when insert empty string' do
      it 'returns nil' do
        expect(trie_node.insert('')).to be_nil
      end
    end

    context 'when insert valid input' do
      before { ['tree', 'try', 'can', 'cartoon', 'cart', 'cat', 'kate'].each { trie_node.insert(_1) } }

      it 'creates characters with trie nodes' do
        expect(trie_node).not_to be_nil
      end
    end
  end

  describe '#search' do
    context 'when search for a word' do
    end

    context 'when display words available in the trie' do
    end
  end
end
