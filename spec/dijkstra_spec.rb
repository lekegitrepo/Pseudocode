# frozen_string_literal: true

require_relative '../implementation/dijkstra'

RSpec.describe 'Dijkstra' do
  context 'when given a correct input' do
    let(:graph) do
      {
        'A': { 'B': 1, 'C': 4 },
        'B': { 'C': 2, 'D': 5 },
        'C': { 'D': 1 },
        'D': {}
      }
    end

    it 'computes the shortest path from the given node' do
      expect(dijkstra(graph, 'A')).to eq({
        'A': 0,
        'B': 1,
        'C': 3,
        'D': 4
      })
    end
  end

  context 'when given a wrong input' do
    it 'returns nil' do
      expect(dijkstra(graph, '')).to be_nil
    end
  end
end

