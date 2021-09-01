# Given the below usage of the 'Person' class, code the class definition.

# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name                  # => 'Robert'

##############################################################################

# class Person
#   attr_accessor :name

#   def initialize(name)
#     self.name = name
#   end

# end

# bob = Person.new('bob')
# puts bob.name                  # => 'bob'
# bob.name = 'Robert'
# puts bob.name                  # => 'Robert'

##############################################################################

# Modify the class definition from above to facilitate the following methods.
# Note that there is no name= setter method now.

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

##############################################################################

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(name)
#     self.first_name = name
#     self.last_name = ''
#   end

#   def name
#     first_name + ' ' + last_name
#   end

# end

# bob = Person.new('Robert')
# puts bob.name                  # => 'Robert'
# puts bob.first_name            # => 'Robert'
# puts bob.last_name             # => ''
# bob.last_name = 'Smith'
# puts bob.name                  # => 'Robert Smith'

##############################################################################

# Now create a smart name= method that can take just a first name or a full name,
# and knows how to set the first_name and last_name appropriately.

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# bob.first_name            # => 'John'
# bob.last_name             # => 'Adams'

##############################################################################

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    self.first_name = name
    self.last_name = ''
  end

  def name
    first_name + ' ' + last_name
  end
  
  def name=(n)
    @full = n.split(' ')
    self.first_name = @full[0]
    self.last_name = @full[1]
  end

end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'
