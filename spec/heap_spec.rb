# frozen_string_literal: true

require_relative '../implementation/heap'

RSpec.describe Heap do
  subject(:heap) { described_class.new }

  describe 'min insertion' do
    context 'when min value is inserted' do
      before { heap.min_heap_insertion(arr, 2) }

      let(:arr) { [3, 5, 9, 6, 8, 10, 12] }

      it 'returns an array in min-heap structure' do
        expect(arr[0]).to eq 2
      end
    end
  end

  describe 'max insertion' do
    context 'when max value is inserted' do
      before { heap.max_heap_insertion(arr, 20) }

      let(:arr) { [3, 5, 9, 6, 8, 10, 12] }

      it 'returns an array in max-heap structure' do
        expect(arr[0]).to eq 20
      end
    end
  end
end
