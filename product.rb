class Product
  def initialize(item)
    match = item.match(/(\d+)\s(.*)\sat\s([\d.]+)/)
    raise ArgumentError unless match

    @quantity = match[1].to_i
    @name = match[2]
    @base_price =  match[3].to_f
    @imported =  name.match?(/imported/)
  end

  attr_accessor :name, :quantity, :base_price, :imported
end
