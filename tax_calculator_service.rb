class TaxCalculatorService
  def initialize(product)
    @product = product
  end

  def call
    total_taxes = product.base_price * total_tax_rate
    round_up_to_nearest_05(total_taxes)
  end

  attr_accessor :product

  private

  def round_up_to_nearest_05(number)
    (number * 20).ceil / 20.0
  end

  def total_tax_rate
    basic_sales_tax# + import_duty
  end

  def basic_sales_tax
    free_basic_sales_tax_categories = %w[food medical book]
    free_basic_sales_tax_categories.include?(product.category) ? 0 : 0.1
  end
end
