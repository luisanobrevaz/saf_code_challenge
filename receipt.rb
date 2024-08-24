# frozen_string_literal: true

class Receipt
  def initialize(file_path)
    parsed_items = File.readlines(file_path).map(&:chomp)

    @products = parsed_items.map { |item| Product.new(item) }
  end

  def print
    puts receipt_output
  end

  attr_accessor :products

  private

  def receipt_output
    lines = products.map do |p|
      "#{p.quantity} #{p.name}: #{format('%.2f', p.total_price)}"
    end
    lines << "Sales Taxes: #{format('%.2f', sales_taxes_sum)}"
    lines << "Total: #{format('%.2f', total_price_sum)}"

    lines.join("\n")
  end

  def sales_taxes_sum
    products.sum(&:total_tax)
  end

  def total_price_sum
    products.sum(&:total_price)
  end
end
