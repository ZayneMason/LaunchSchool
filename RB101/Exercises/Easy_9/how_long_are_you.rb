# Write a method that takes a string as an argument, and returns an Array that contains every word from the string,
# to which you have appended a space and the word length.
# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

# Problem:
# -- input: string of words
# -- output: an array of each word alongside its length

# Examples:
# word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
# word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]
# word_lengths("") == []

# -- method needs to be able to split up words by spaces
# -- only one word should be handled fine
# -- symbols attached to words are included
# -- in case of no characters at all, should just return nothing rather than a space and 0

# Data structure:
# -- strings being analyzed and appened to an array

# Algo/Logic:
# -- create an array that points to taking string and using #split in order to get an array of the words in the string, we are defining where to split each one with
# -- set a conditional in which when the array is empty we break
# -- with this array, use each to iterate over each word and append to it " #{param_for_string.length}"
# -- return the array after it is iterated over

def word_lengths(string)
  count_arr = string.split
  return count_arr if count_arr.empty?

  count_arr.each do |word|
    word << " #{word.length}"
  end
  count_arr
end

# Test cases:
puts(word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"],
word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"],
word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"],
word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"],
word_lengths("") == [])
