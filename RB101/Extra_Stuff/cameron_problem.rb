# Write a method that takes any integer greater than or equal to 0,
# and returns that number correctly seperated by commas.
# This documentation may be useful: https://ruby-doc.org/core-3.0.2/Enumerable.html#method-i-each_slice

# Test cases:
puts(seperator(1000) == '1,000')
puts(seperator(100) == '100')
puts(seperator(990999) == '990,999')
puts(seperator(98) == '98')
