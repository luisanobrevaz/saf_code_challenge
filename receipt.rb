# frozen_string_literal: true

require './services/create_product_service'

class Receipt
  def initialize(file_path)
    parsed_items = File.readlines(file_path).map(&:chomp)

    @products = parsed_items.map { |item| CreateProductService.new.call(item) }
  end

  def print
    puts receipt_output
  end

  attr_accessor :products

  private

  def receipt_output
    lines = products.map { |p| product_format_line(p) }
    lines << "Sales Taxes: #{format('%.2f', sales_taxes_sum)}"
    lines << "Total: #{format('%.2f', total_price_sum)}"

    lines.join("\n")
  end

  def product_format_line(product)
    "#{product.quantity} #{product.name}: #{format('%.2f', product.total_price)}"
  end

  def sales_taxes_sum
    products.sum(&:total_tax)
  end

  def total_price_sum
    products.sum(&:total_price)
  end
end
