require './product'

class CreateProductService
  def call(item_description)
    match = item_description.match(/(\d+)\s(.*)\sat\s([\d.]+)/)
    raise ArgumentError unless match

    product_name = match[2]

    Product.new(quantity: match[1].to_i,
                name: product_name,
                base_price: match[3].to_f,
                imported: product_name.match?(/imported/),
                category: category(product_name))
  end

  private

  def category(product_name)
    category_options.find do |category_name, items|
      return category_name if items.any? { |item| product_name.include?(item) }
    end

    'unknown'
  end

  def category_options
    {
      'food' => %w[apple orange chocolate fruit],
      'book' => ['book'],
      'medical' => %w[seringe pills odometer]
    }
  end
end
