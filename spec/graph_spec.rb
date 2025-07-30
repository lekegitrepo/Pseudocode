# frozen_string_literal: true

RSpec.describe 'Graph' do
  describe '#add_edge' do
    let(:graph_map) { {} }

    context 'with valid input' do
      it 'returns the inserted value' do
        expect(add_edge(graph_map, 'A', 'B')).to eq({'A': ['B'], 'B': ['A']})
        expect(graph_map).not_to be_empty
      end
    end

    context 'with invalid input' do
      let(:graph_map) { nil }
      it 'returns the inserted value' do
        expect(add_edge(graph_map, 'A', 'B')).to be_nil
      end
    end
  end
end
