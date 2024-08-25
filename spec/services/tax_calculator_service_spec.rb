# frozen_string_literal: true

require './services/tax_calculator_service'

RSpec.describe TaxCalculatorService do
  describe 'call' do
    subject(:call) { described_class.new(product).call }

    let(:product) do
      Product.new(quantity: 2, name: 'some product', base_price: base_price,
                  imported: imported, category: category)
    end
    let(:imported) { false }
    let(:category) { 'some' }
    let(:base_price) { 10.00 }

    it 'returns the tax' do
      expect(call).to eq(1.00)
    end

    context 'when category is book' do
      let(:category) { 'book' }

      it 'returns 0 tax' do
        expect(call).to eq(0)
      end

      context 'when product is a imported' do
        let(:imported) { true }

        it 'returns the tax' do
          expect(call).to eq(0.50)
        end
      end
    end

    context 'when product is food' do
      let(:category) { 'food' }

      it 'returns 0 tax' do
        expect(call).to eq(0)
      end
    end

    context 'when product is a medical supply' do
      let(:category) { 'medical' }

      it 'returns 0 tax' do
        expect(call).to eq(0)
      end
    end

    context 'when product is a imported' do
      let(:imported) { 'true' }

      it 'sums the taxes' do
        expect(call).to eq(1.50)
      end
    end

    context 'when price is near bondery' do
      let(:base_price) { 9.75 }

      it 'rounds up the taxes' do
        expect(call).to eq(1.00)
      end
    end
  end
end
