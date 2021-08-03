# Write a method that takes two strings as arguments, determines the longest of the two strings, then
# returns the result of concatenating the shorter string, the longer string, and the shorter string
# once again. You may assume that the strings are of different lengths.

def short_long_short(str1, str2)
  if str1.size > str2.size
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

# Tests:
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
