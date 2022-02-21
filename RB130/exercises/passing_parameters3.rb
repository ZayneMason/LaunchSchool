# Given this code:
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the corresponding output.

gather(items) do |*first_three, wheat|
  puts first_three.join(', ')
  puts wheat
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |apples, *veggies, wheat|
  puts apples
  puts veggies.join(', ')
  puts wheat
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |apples, *the_rest|
  puts apples
  puts the_rest.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |a, c, cb, w|
  puts "#{a}, #{c}, #{cb}, #{w}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!