# Part One:
# Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object.
# Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)

# Part Two:
# Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet,
# that prints a greeting when invoked.

# Part Three:
# Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet

# Part Four:
# Using the code from the previous exercise, add a setter method named #name=. Then rename kitty to 'Luna' and invoke #greet again.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet
