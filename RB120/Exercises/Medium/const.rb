class Vehicle
  WHEELS = 4
  def initialize
  end

  def wheels
    self.class::WHEELS
  end
end

class Motorcycle < Vehicle
  WHEELS = 2
  def initialize
  end
end

moto = Motorcycle.new
puts moto.wheels
car = Vehicle.new
puts car.wheels

module Swag
  SWAG = 1
  def swag_test
    SWAG
  end
end

class Swag_check
  include Swag
  SWAG = 2
  def initialize
  end
end

swag = Swag_check.new

puts swag.swag_test
