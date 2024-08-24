require './tax_calculator_service'
require './product'
require 'byebug'

RSpec.describe TaxCalculatorService do
  let(:call) { described_class.new(product).call }

  describe 'init' do
    let(:product) { Product.new('1 bottle of perfume at 10.00') }

    it 'returns the tax' do
      expect(call).to eq(1.00)
    end

    context 'when product is a book' do
      let(:product) { Product.new('1 book at 10.00') }

      it 'returns 0 tax' do
        expect(call).to eq(0)
      end

      context 'when product is a imported' do
        let(:product) { Product.new('1 imported book at 10.00') }

        it 'returns the tax' do
          expect(call).to eq(0.50)
        end
      end
    end

    context 'when product is food' do
      let(:product) { Product.new('1 chocolate bar at 10.00') }

      it 'returns 0 tax' do
        expect(call).to eq(0)
      end
    end

    context 'when product is a medical supply' do
      let(:product) { Product.new('1 packet of headache pills at 10.00') }

      it 'returns 0 tax' do
        expect(call).to eq(0)
      end
    end

    context 'when product is a imported' do
      let(:product) { Product.new('1 imported bottle of perfume at 10.00') }

      it 'sums the taxes' do
        expect(call).to eq(1.50)
      end
    end
  end
end
