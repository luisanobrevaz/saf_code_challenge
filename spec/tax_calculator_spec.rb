require './tax_calculator_service'
require './product'
require 'byebug'

RSpec.describe TaxCalculatorService do
  let(:call) { described_class.new(product).call }

  describe 'init' do
    let(:product) { Product.new('1 bottle of perfume at 18.99') }

    it 'returns the tax' do
      expect(call).to eq(1.90)
    end

    context 'when product is a book' do
      let(:product) { Product.new('1 book at 12.49') }

      it 'returns the tax' do
        expect(call).to eq(0)
      end
    end

    context 'when product is food' do
      let(:product) { Product.new('1 chocolate bar at 0.85') }

      it 'returns the tax' do
        expect(call).to eq(0)
      end
    end

    context 'when product is a medical supply' do
      let(:product) { Product.new('1 packet of headache pills at 9.75') }

      it 'returns the tax' do
        expect(call).to eq(0)
      end
    end
  end
end
