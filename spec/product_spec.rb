# frozen_string_literal: true

require './product'

RSpec.describe Product do
  describe 'initialize' do
    subject(:product) do
      described_class.new(quantity: 2, name: 'book', base_price: 12.49,
                          imported: false, category: 'unknown')
    end

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

    it 'sets the category' do
      expect(product.category).to eq('unknown')
    end
  end

  describe 'total_tax' do
    subject(:product) do
      described_class.new(quantity: 2, name: 'CD', base_price: 10.00,
                          imported: false, category: 'unknown')
    end

    it 'returns the tax' do
      expect(product.total_tax).to eq(2.00)
    end
  end

  describe 'total_price' do
    subject(:product) do
      described_class.new(quantity: 2, name: 'CD', base_price: 10.00,
                          imported: false, category: 'unknown')
    end

    it 'returns the tax' do
      expect(product.total_price).to eq(22.00)
    end
  end
end
