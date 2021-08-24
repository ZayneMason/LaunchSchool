# Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance
# variables that tell us the year, color, and model of the car.
# Create an instance variable that is set to 0 during instantation of the object to track the current speed of the car as well.
# Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(y, c, m)
    self.year = y
    self.color = c
    self.model = m
    self.speed = 0
  end

  def info
    "This vehicle is a #{self.color} #{self.year} #{self.model}."
  end

  def accelerometer
    "The car is traveling at #{self.speed} mph."
  end

  def accelerate(accel_amount)
    self.speed += accel_amount
    "The car is now at #{self.speed}mph."
  end

  def brake(brake_amount)
    self.speed -= brake_amount
    "The car is now at #{self.speed} mph."
  end

  def engine_switch(off_or_on)
    case off_or_on.downcase
    when "off"
      self.speed = 0
      "The car is off and stopped."
    when "on"
      "The car is on."
    end
  end
end

zayne_car = MyCar.new(2013, "blue", "Subaru")
puts zayne_car.info
puts zayne_car.engine_switch("on")
puts zayne_car.accelerate(50)
puts zayne_car.accelerometer
puts zayne_car.brake(20)
puts zayne_car.accelerometer
puts zayne_car.engine_switch("off")
puts zayne_car.accelerometer
