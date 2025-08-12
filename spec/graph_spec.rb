# frozen_string_literal: true

require_relative '../implementation/graph'

RSpec.describe 'Graph' do
  describe '#add_edge' do
    let(:graph_map) { {} }

    context 'with valid input' do
      it 'returns the inserted value' do
        expect(add_edge(graph_map, 'A', 'B')).to eq({'A': ['B'], 'B': ['A']})
        expect(graph_map).not_to be_empty
      end
    end

    context 'when graph_map initial value is nil' do
      let(:graph_map) { nil }
      it 'returns the inserted value' do
        expect(add_edge(graph_map, 'A', 'B')).to eq({'A': ['B'], 'B': ['A']})
        expect(graph_map).not_to be_nil
      end
    end
  end

  describe '#bfs_traversal' do
    let(:graph) do
      {
        'A' => ['B', 'C'],
        'B' => ['D'],
        'C' => ['D'],
        'D' => []
      }
    end

    context 'with valid input' do
      it 'returns visited nodes' do
        expect(bfs_traversal(graph, 'C').inspect).to include('C', 'D')
      end
    end
  end

  describe '#dfs_traversal' do
    let(:graph) do
      {
        'A' => ['B', 'C'],
        'B' => ['D'],
        'C' => ['D'],
        'D' => []
      }
    end

    let(:visited) { nil }

    context 'with valid input' do
      it 'returns visited nodes' do
        expect(dfs_traversal(graph, 'C', visited).to_a).to eq ['C', 'D']
      end
    end
  end
end
