# Part One:
# Create a superclass called Vehicle for your M vehicle class to inherit from and move the behavior that isn't specific to the M vehicle class to the superclass.
# Create a constant in your M vehicle class that stores information about the vehicle that makes it different from other types of Vehicles.

# Part Two:
# Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass.
# Create a method to print out the value of this class variable as well.

# Part Three:
# Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.

# Part Four:
# Print to the screen your method lookup for the classes that you have created.

# Part Five:
# Move all of the methods from the M vehicle class that also pertain to the MyTruck class into the Vehicle class.
# Make sure that all of your previous method calls are working when you are finished.

# Part Six:
# Write a method called age that calls a private method to calculate the age of the vehicle.
# Make sure the private method is not available from outside of the class.
# You'll need to use Ruby's built-in Time class to help.

class Vehicle
  @@times_made = 0
  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    self.color = c
    self.model = m
    self.speed = 0
    self.view_info
    @@times_made += 1
  end

  def to_s
    "#{self.color} #{self.year} #{self.model}"
  end

  def self.gas_milage(miles, gallons)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def view_age
    "Your vehicle is #{get_age} years old"
  end

  def view_info
    puts "Your vehicle is a #{self.color} #{self.year} #{self.model}."
  end

  def view_accelerometer
    puts "Your vehicle is traveling at #{self.speed} mph." if self.speed > 0
    puts "Your vehicle is stopped." if self.speed == 0
  end

  def view_current_color
    puts "Your vehicle is #{self.color}."
  end

  def view_year
    puts "Your vehicle was made in #{self.year}."
  end

  def view_model
    puts "Your vehicle is a #{self.model}."
  end

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
      puts "You turn your vehicle off."
      self.speed = 0
    when "on"
      puts "You start your vehicle."
    end
  end

  def spray_paint(new_color)
    puts "Painting your vehicle #{new_color}..."
    self.color = new_color
  end
  
  def self.milage(miles, gallons)
    "#{miles / gallons} miles per gallon."
  end

  private

  def get_age
    Time.now.year - self.year
  end

end

module Trailer
  def hitch_trailer
    "Trailer hitched."
  end
end

class MyCar < Vehicle
  DOOR_COUNT = 4
end

class MyTruck < Vehicle
  include Trailer
  DOOR_COUNT = 2
end

puts MyTruck.ancestors
puts "---------------------------"
puts MyCar.ancestors
puts "---------------------------"
puts Vehicle.ancestors
truck = MyTruck.new(1990, "blue", "Ford")
puts truck.view_age