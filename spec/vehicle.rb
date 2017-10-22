class Vehicle
  attr_accessor :name, :mark_up, :price_limit

  def initialize(name, mark_up, price_limit, length, width, height, weight)
    @name = name
    @mark_up = mark_up
    @price_limit = price_limit
    @length = length
    @width = width
    @height = height
    @weight = weight
  end


  def size
    return @width * @length * @height
  end


end