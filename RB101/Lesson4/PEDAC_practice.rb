# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

#Rules: return palindrome substrings (same word in reverse)
#       must be case sensitive
#Implicit rules: return them as an array, empty will return nothing
#                parts of words count
#Input: string
#Output: array of palindrome substrings

#Algorithm:
# - create an empty array called `result` that will contain all required substrings
# - create a `starting_index` variable (value `0`) for the starting index of a substring
# - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#   - create a `num_chars` variable (value `2`) for the length of a substring
#   - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#     - extract a substring of length `num_chars` from `string` starting at `starting_index`
#     - append the extracted substring to the `result` array
#     - increment the `num_chars` variable by `1`
#   - end the inner loop
#   - increment the `starting_index` variable by `1`
# - end the outer loop
# - return the `result` array
# - create a `is_palindrome?` method, to check whether the string
#   value is equal to its reversed value.
# - create palindrome_substrings method
#   - initialize palindromes array variable
#   - use subtrings method on input as substrings variable
#     - for each check is_palindrome?
#     - if true, append to palindromes array
#   - return palindromes

def substrings(str)
  result = []
  starting_index = 0

  while starting_index <= str.length - 2
    num_chars = 2
    while num_chars <= str.length - starting_index
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  arr = substrings(str)
  palindromes = []
  arr.each do |string|
    palindromes << string if is_palindrome?(string)
  end
  palindromes
end

puts palindrome_substrings('Does this thing really work? RACECAR')
