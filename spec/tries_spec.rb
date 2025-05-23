require_relative '../implementation/tries'
require 'pry'
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
        expect(trie_node.root.children['t'].end_of_word).to be_falsy
        expect(trie_node.root.children.keys).to eq ['t', 'c', 'k']
        expect(trie_node.root.children.keys.size).to eq 3
      end
    end
  end

  describe 'Search' do
    before { ['can', 'canny', 'face'].each { trie_node.insert(_1) } }

    context 'when search for a word' do
      context 'when the word is in the trie' do
        it 'returns true and the node with it children' do
          expect(trie_node.exists?('can')).to be_truthy
        end
      end

      context 'when the word is not in the trie' do
        it 'returns false' do
          expect(trie_node.exists?('card')).to be_falsy
        end
      end
    end

    context 'when list words available in the trie' do
      before { words.each { trie.insert(_1) } }

      let(:trie) { TrieNode.new }

      let(:words) { ['root', 'run', 'road', 'cat', 'car', 'kind', 'dune'].sort }

      it 'returns array of words' do
        expect(trie.list_words(trie.root).sort).to match words
      end
    end
  end
end
