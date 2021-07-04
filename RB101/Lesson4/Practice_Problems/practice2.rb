# Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_of_ages = 0
ages.each do |_name, age|
  sum_of_ages += age
end

puts sum_of_ages

# OR
puts ages.values.inject(:+)
