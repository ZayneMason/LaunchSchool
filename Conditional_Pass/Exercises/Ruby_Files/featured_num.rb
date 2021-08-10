# A featured number (something unique to this exercise) is an odd number that is a multiple of 7,
# and whose digits occur exactly once each.
# So, for example, 49 is a featured number, but 98 is not (it is not odd),
# 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument,
# and returns the next featured number that is greater than the argument.

# Return an error message if there is no next featured number.

# Problem:
# -- input: integer
# -- output: integer (next featured number)
# -- Take in integer, given this integer find the first integer after it that is odd, has all unique digits,
# -- and is divisible by 7.
# -- If there is no number after it that fit the criteria, output an error message.

# Examples:
# -- If an argument is a featured number, we should still find the next featured number.
# -- We can infer based off of numerical understanding the final example that it would be impossible for any number above 10
# -- Digits to be a "featured number". There are only 10 unique digits in a base-10 system.
# ---- For sake of speed and a usable program, we should consider any number above 10 digits non-featured so we do not
# ---- indefinitely check numbers.
# -- error message should be returned, not output

# Data structure:
# -- integers and arrays

# Algorithm:
# -- Outline an evaluation technique to check if a number is a featured number.
# -- Repeatedly increment number until it is a featured number.
# -- If integer is a featured number, return it.
# -- If integer cannot become a featured number , return error message.

# Solution 1:

# We will outline and streamline our evaluation technique by creating a helper method that returns true if a number is a
# featured number.
def featured_number?(num)
  # Our evaluation technique will be seeing if num is divisible by 7 && is odd && an array of its digits == an array of its
  # unique digits.
  (num % 7 == 0 &&
   num.odd? &&
   num.digits == num.digits.uniq)
end
## p featured_number?(7) , featured_number?(8) == false, featured_number?(14) == false, featured_number?(77) == false

# Now we can make a main method that loops incrementing our argument number until it is a featured number, and returns it,
# or until it cannot become a featured number.
def featured(int)
  # We first need to increment int initially so we do not end the loop early with int already being a featured number.
  int += 1
  # We are going to use until so that we can stop incrementing as soon as int is evaluated as a featured number.
  until featured_number?(int)
    int += 1
    ## p int
    # We need to break if number's size passes 10 digits so we don't infinitely loop.
    break if int.digits.size > 10
  end
  # Because the loop is broken at this point and we do not know if it because of int's length, we can evaluate
  # again if it is a featured number, and create a ternary expression where if it is, we return int.
  # Otherwise, the ternary expression will return an error message.
  featured_number?(int) ? int : 'There is no possible number that fulfills those requirements'
end

# Solution 2:

# We are again going to create a helper method that will evaluate if a number is a featured number.
# This method can work with the exact same logic as before, the requirements of a featured number have not changed.
def featured_number?(num)
  (num % 7 == 0 &&
   num.odd? &&
   num.digits == num.digits.uniq)
end

# In the new main method I wanted to do something cool and use irb to find the highest featured number possible.
# I plugged in my featured_number? method to irb, and created a variable num = 10_000_000_000 and incrememnted it down
# until it was a featured number, the result was 9_876_543_201, which we can view as the max featured number.
# Using this number, we can set a limit (num > 9_876_543_201), which would be faster than allowing our loop to go until
# our number passes 10 digits.
# We are going to name our main method featured_two so we can seperate test cases.
def featured_two(int)
  # We again need to increment our argument before we start a loop so it does not break instantly.
  int += 1
  until featured_number?(int)
    int += 1
    # In this solution, instead of breaking if our number passes 10 digits, I am going to set a conditional:
    if int > 9_876_543_201
      # With the condition, before breaking, we can set int to point to our error message, this way we can
      # return int and not need to evaluate again if it is a featured num or not.
      int = 'There is no possible number that fulfills those requirements'
      break
    end
  end
  int
end

# Test cases:

## require 'benchmark'
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> 'There is no possible number that fulfills those requirements'
## p (Benchmark.measure { featured(9_999_999_999) })

p featured_two(12) == 21
p featured_two(20) == 21
p featured_two(21) == 35
p featured_two(997) == 1029
p featured_two(1029) == 1043
p featured_two(999_999) == 1_023_547
p featured_two(999_999_987) == 1_023_456_987
p featured_two(9_999_999_999) # -> 'There is no possible number that fulfills those requirements'
## p (Benchmark.measure { featured_two(9_999_999_999) })

# Additional Note:
# -- My hypothesis of it being faster to check if int > the max featured number was true.
# -- Using benchmark from the standard library I could see that:
# ---- It took roughly 9 seconds to calculate featured(9_999_999_999) on the macbook I am currently using.
# ---- While it only took about 3 seconds to calculate featured_two(9_999_999_999)

# Solutions without implementation notes or commented debugging lines:

# Solution 1:

# def featured_number?(num)
#   (num % 7 == 0 &&
#    num.odd? &&
#    num.digits == num.digits.uniq)
# end

# def featured(int)
#   int += 1
#   until featured_number?(int)
#     int += 1
#     break if int.digits.size > 10
#   end
#   featured_number?(int) ? int : 'There is no possible number that fulfills those requirements'
# end

#-----------------------------------------------------------------------------------------------

# Solution 2:

# def featured_number?(num)
#   (num % 7 == 0 &&
#    num.odd? &&
#    num.digits == num.digits.uniq)
# end

# def featured_two(int)
#   int += 1
#   until featured_number?(int)
#     int += 1
#     if int > 9_876_543_201
#       int = 'There is no possible number that fulfills those requirements'
#       break
#     end
#   end
#   int
# end
