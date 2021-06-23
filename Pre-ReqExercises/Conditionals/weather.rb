#In the code below, sun is randomly assigned as 'visible' or 'hidden'.
sun = ['visible', 'hidden'].sample

#Write an if statement that prints "The sun is so bright!" if sun equals 'visible'.

if sun == 'visible'
  puts "The sun is so bright!"
end

#Write an unless statement that prints "The clouds are blocking the sun!" unless sun equals 'visible'.

unless sun == 'visible'
  puts "The clouds are blocking the sun!"
end

#one liners

puts 'The clouds are blocking the sun!' unless sun == 'visible'
puts 'The sun is so bright!' if sun == 'visible'
