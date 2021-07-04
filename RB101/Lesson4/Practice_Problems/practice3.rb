# In the age hash: 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# Remove people with age 100 or greater

ages.select! do |_name, age|
  age < 100
end

puts ages

# Better way:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if do |_name, age|
  age < 100
end
puts ages

#if nothing is changed in select! it will return nil. keep_if always returns the collection.
