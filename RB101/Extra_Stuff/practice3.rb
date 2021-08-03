# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters,
# as well as characters that were neither of those two. Now we want to go one step further.
# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the percentage of characters in the string that are lowercase letters,
# one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.
# You may assume that the string will always contain at least one character.

# input : string
# output : hash containing 3 entries, a pair for percentage of lowercase, percentage of upper, percentage of neither
# from examples: numbers and symbols == neither

# data structure: inputing a string, outputting a hash based on info from string
# ---3 key value pairs as needed for output

# algo/logic: range of ascii values for upper and lower, subtract qualifying from total to get the "neither" count.

# method for finding upper
# method for lower
# method neither
# core method "letter_percentages", use division + floats for percentages
# in core, use conditionals to add to a sum for each that we will use to find percentages

def uppercase?(string)
  (65..90).to_a.include?(string.ord)
end

def lowercase?(string)
  (97..122).to_a.include?(string.ord)
end

def category(string)
  uppers = 0
  lowers = 0
  string.chars.each do |letter|
    uppers += 1 if uppercase?(letter)
    lowers += 1 if lowercase?(letter)
  end
  neither = string.length - (uppers + lowers)
  [uppers, lowers, neither]
end

def letter_percentages(string)
  percentage_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  values_array = category(string)
  percentage_hash[:uppercase] = (values_array[0] / string.length.to_f) * 100
  percentage_hash[:lowercase] = (values_array[1] / string.length.to_f) * 100
  percentage_hash[:neither] = (values_array[2] / string.length.to_f) * 100
  percentage_hash
end

# Tests:
puts letter_percentages('abCdef 123') # == ({ lowercase: 50.0, uppercase: 10.0, neither: 40.0 })
puts letter_percentages('AbCd +Ef') # == ({ lowercase: 37.5, uppercase: 37.5, neither: 25.0 })
puts letter_percentages('123') # == ({ lowercase: 0.0, uppercase: 0.0, neither: 100.0 })
puts letter_percentages('11aBa3     ')
