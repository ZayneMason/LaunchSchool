# Part One:
# Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance
# variables that tell us the year, color, and model of the car.
# Create an instance variable that is set to 0 during instantation of the object to track the current speed of the car as well.
# Create instance methods that allow the car to speed up, brake, and shut the car off.

# Part Two:
# Add an accessor method to your MyCar class to change and view the color of your car.
# Then add an accessor method that allows you to view, but not modify, the year of your car.

# Part Three:
# You want to create a nice interface that allows you to accurately describe the action you want your program to perform.
# Create a method called spray_paint that can be called on an object and will modify the color of the car.

class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(y, c, m)
    self.year = y
    self.color = c
    self.model = m
    self.speed = 0
    self.view_info
  end

  # Information:

  def view_info
    puts "Your car is a #{self.color} #{self.year} #{self.model}."
  end

  def view_accelerometer
    puts "Your car is traveling at #{self.speed} mph." if self.speed > 0
    puts "Your car is stopped." if self.speed == 0
  end

  def view_current_color
    puts "Your car is #{self.color}."
  end

  def view_year
    puts "Your car was made in #{self.year}."
  end

  def view_model
    puts "Your car is a #{self.model}."
  end

  # Actions:

  def accelerate(accel_amount)
    puts "You speed up by #{accel_amount} mph..."
    self.speed += accel_amount
  end

  def brake(brake_amount)
    if (self.speed - brake_amount) < 0
      puts "You can't slow down past 0 mph..."
    else
      puts "You slow down by #{brake_amount} mph..."
      self.speed -= brake_amount
    end
  end

  def engine_switch(off_or_on)
    case off_or_on.downcase
    when "off"
      puts "You turn your car off."
      self.speed = 0
    when "on"
      puts "You start your car."
    end
  end

  def spray_paint(new_color)
    puts "Painting your car #{new_color}..."
    self.color = new_color
  end

end

puts "------------------------------------------------------------------"
puts "Testing creating object, viewing its states, and modifying them:"
puts "------------------------------------------------------------------"
zayne_car = MyCar.new(2013, "blue", "Subaru")
zayne_car.view_current_color
zayne_car.view_year
zayne_car.view_model
zayne_car.engine_switch("on")
zayne_car.accelerate(50)
zayne_car.view_accelerometer
zayne_car.brake(20)
zayne_car.view_accelerometer
zayne_car.engine_switch("off")
zayne_car.view_accelerometer
zayne_car.spray_paint("red")
zayne_car.view_current_color
zayne_car.view_info
puts "------------------------------------------------------------------"
puts "Testing common sense conditions:"
puts "------------------------------------------------------------------"
zayne_car.engine_switch("on")
zayne_car.accelerate(10)
zayne_car.view_accelerometer
zayne_car.brake(20)
zayne_car.view_accelerometer
zayne_car.brake(10)
zayne_car.view_accelerometer
puts "------------------------------------------------------------------"
