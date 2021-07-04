# Create a hash that expresses the frequency with which each letter occurs in this string: 
statement = "The Flintstones Rock"
# Ex: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

freq_hash = {}
counter = 0
loop do
  break if counter == statement.split('').count

  current_letter = statement.split('')[counter]

  if freq_hash.keys.include?(current_letter) == false
    freq_hash.keys << current_letter
    freq_hash[current_letter] = 1
  elsif freq_hash.keys.include?(current_letter)
    freq_hash[current_letter] += 1
  end

  counter += 1
end

puts freq_hash

# More efficient way is creating an array of the alphabet and scanning the statement for each letter and counting them:
result = {}
# set an array of possible letters
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  # set the amount of times each letter appears with .scan(letter).count
  letter_frequency = statement.scan(letter).count
  # set the hash value for that letter to be the scan count, would be pointless to include letters that do not appear
  result[letter] = letter_frequency if letter_frequency > 0
end

puts result

# String#scan is a method that iterates through a string, matching the pattern argument and generates an array of occurences of that pattern
# .count returns how many elements are in an array
# The more efficient way also outputs in alphabetical and case order
