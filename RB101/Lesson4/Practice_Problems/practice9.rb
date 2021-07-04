# As we have seen previously we can use some built-in string methods to change the case of a string.
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize.
# This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.
# Write your own version of String#titleize

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

puts titleize('the flintstones rock')

# .split returns a array out of the words in the string, .map modifies each array element, .join makes a string out of the array elements
