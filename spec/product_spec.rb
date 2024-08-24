require './product'
require 'byebug'


RSpec.describe Product do
  let(:product) { described_class.new(item_description) }

  describe 'initialize' do
    let(:item_description) { '2 book at 12.49' }

    it 'sets the quantity' do
      expect(product.quantity).to eq(2)
    end

    it 'sets the name' do
      expect(product.name).to eq('book')
    end

    it 'sets the base_price' do
      expect(product.base_price).to eq(12.49)
    end

    it 'sets imported as false' do
      expect(product.imported).to eq(false)
    end

    context 'when item_descrition is not on correct format' do
      let(:item_description) { '12.49 for 2 books' }

      it 'raises an error' do
        expect{ product } .to raise_error ArgumentError
      end
    end

    context 'when item_descrition contains imported' do
      let(:item_description) { '1 imported bottle of perfume at 47.50' }

      it 'sets the complete name' do
        expect(product.name).to eq('imported bottle of perfume')
      end

      it 'sets imported as true' do
        expect(product.imported).to eq(true)
      end
    end
  end
end
