# frozen_string_literal: true

require './services/tax_calculator_service'

class Product
  attr_accessor :name, :quantity, :base_price, :imported, :category

  def initialize(quantity:, name:, base_price:, imported:, category:)
    @quantity = quantity
    @name = name
    @base_price = base_price
    @imported = imported
    @category = category
  end

  def total_price
    (base_price + unit_tax) * quantity
  end

  def total_tax
    unit_tax * quantity
  end

  private

  def unit_tax
    @unit_tax ||= TaxCalculatorService.new(self).call
  end
end
