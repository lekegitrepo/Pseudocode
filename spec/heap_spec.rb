# frozen_string_literal: true

require_relative '../implementation/heap'

RSpec.describe Heap do
  subject(:heap) { described_class.new }

  let(:arr) { [3, 5, 9, 6, 8, 10, 12] }

  describe 'min insertion' do
    context 'when min value is inserted' do
      before { heap.min_heap_insertion(arr, 2) }

      it 'returns an array in min-heap structure' do
        expect(arr[0]).to eq 2
      end
    end
  end

  describe 'max insertion' do
    context 'when max value is inserted' do
      before { heap.max_heap_insertion(arr, 20) }

      it 'returns an array in max-heap structure' do
        expect(arr[0]).to eq 20
      end
    end
  end

  describe 'max extraction' do
    before { heap.max_heap_insertion(arr, 15) }
    context 'when the max is removed' do
      it 'returns the max value and maintain the heap property for the list' do
        expect(heap.extract_max(arr)).to eq 15
        expect(arr).not_to include(15)
      end
    end
  end

  describe 'build max heap' do
    context 'with random array values' do
      it 'constructs the array with heap properties' do
        expect(heap.build_max_heap([13, 20, 1, 16, 4, 30, 60])).to match [60, 20, 30, 16, 4, 13, 1]
      end
    end
  end

  describe 'delete' do
    let(:arr) { [60, 20, 30, 16, 4, 13, 1] }
    context 'when value is remove from a give index' do
      it 'removes the value and constructs the array with heap properties' do
        expect(heap.delete_at(arr, 2)).to match [60, 20, 13, 16, 4, 1]
      end
    end
  end
end
