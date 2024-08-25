# frozen_string_literal: true

require './receipt'

RSpec.describe Receipt do
  let(:receipt) { described_class.new(file_path) }
  let(:file_path) { 'spec/support/fixtures/items_list_example.txt' }

  describe 'initialize' do
    it 'sets the products' do
      expect(receipt.products.count).to eq(9)
    end
  end

  describe 'print' do
    let(:expected_print) do
      "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\n1 imported " \
      "box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\n1 " \
      "imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 " \
      "packet of headache pills: 9.75\n3 imported box of chocolates: 35.55\n" \
      "Sales Taxes: 17.05\nTotal: 205.85\n"
    end

    it 'prints the receipt' do
      expect { receipt.print }.to output(expected_print).to_stdout
    end
  end
end
