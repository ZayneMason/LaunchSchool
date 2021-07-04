# Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

hash_stones = {}
flintstones.each_with_index do |name, index|
  hash_stones[name] = index
end

puts hash_stones