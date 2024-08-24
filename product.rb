class Product
  def initialize(item)
    match = item.match(/(\d+)\s(.*)\sat\s([\d.]+)/)
    raise ArgumentError unless match

    @quantity = match[1].to_i
    @name = match[2]
    @base_price = match[3].to_f
    @imported = name.match?(/imported/)
  end

  attr_accessor :name, :quantity, :base_price, :imported

  def category
    category_options.find do |category_name, items|
      return category_name if items.any? { |item| name.include?(item) }
    end

    'unknown'
  end

  def total_price
    (base_price + unit_tax) * quantity
  end

  def total_tax
    unit_tax * quantity
  end

  private

  def category_options
    {
      'food' => ['apple', 'orange', 'chocolate', 'fruit'],
      'book' => ['book'],
      'medical' => ['seringe', 'pills', 'odometer']
    }
  end

  def unit_tax
    TaxCalculatorService.new(self).call
  end
end
