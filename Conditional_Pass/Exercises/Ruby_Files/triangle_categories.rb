# A triangle is classified as follows:
# -- equilateral: All 3 sides are of equal length
# -- isosceles: 2 sides are of equal length, while the 3rd is different
# -- scalene: All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side,
# and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a
# symbol :equilateral, :isosceles, :scalene, or :invalid  depending on whether the triangle is equilateral,
# isosceles, scalene, or invalid.

# Problem:
# -- input: 3 integers reperesenting sides of triangle
# -- output: symbol representing the type of triangle

# Examples:
# -- The order of integers does not matter.
# -- We need to know if a triangle is invalid beyond it not being any of the three categories.
# ---- For example, the last 3 examples are all geometrically invalid, but we need to identify that so they are not
# ---- classified as isosceles or any other possible category of triangle.

# Data structure:
# -- inetegers/floats

# Algortihm: 
# -- Set conditionals to comapare side lengths and determine type of triangle.
# -- If two sides are == and one not, isosceles, if all sides ==, equilateral, if no sides ==, scalene.
# -- Apply triangle inequality theorem to determine if triangle is invalid.
# ---- The sum of any two sides must be greater than the third.

# Solution 1:
# We are going to declare methods for each set of category conditionals for the purpose of readability, and streamlining.
# In all of our category methods we can use the implicit return from comparison to make the return true or false 
# so we can use them in "return...if..." statements

# For equilaterals, we need the method the evaluate to true if all sides are equal.
def equilateral?(side1, side2, side3)
  # We can use && and == comparison to ensure that all sides are equal
  # We only need to see if sides 1 and 2 and 2 and 3 are equal because logically, if side 1 is equal to side 2
  # and 2 is equal to three, 1 and 3 are equal.
  (side1 == side2) && (side2 == side3)
end
## p equilateral?(1, 1, 1)

# For isosceles triangles we need two sides to be equal and the third not.
def isosceles?(side1, side2, side3)
  # We can use a set of &&'s ||'s and =='s to determine if any combo of two sides are equal while one side is not.
  (((side1 == side2) || (side1 == side3) ||
  (side2 == side3)) && ((side1 != side2) ||
  (side1 != side3) || (side2 != side3)))
end
## p isosceles?(1, 2, 1)

# For invalid, we know the triangle inequality theorem.
def invalid?(side1, side2, side3)
  # We can use a set of ||'s to determine if the sum of any two sides is less than or equal to the remaining side.
  side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
end

# We are not going to create a method for evaluating scalenes. If a valid triangle is not equilateral, or isosceles,
# by process of elimination it must be scalene (all sides are not equal and two sides are not equal, all sides are different).

def triangle(side1, side2, side3)
  # Our main method will return symbols based on the return of the evaluation methods.
  # Because we explicity return the first three symbols, we can implicitly return :scalene by process of elimination.
  return :invalid if invalid?(side1, side2, side3)
  return :equilateral if equilateral?(side1, side2, side3)
  return :isosceles if isosceles?(side1, side2, side3)
  :scalene
end

# Solution 2:
# This time around we can use the same comparison methods, however I want to change up the main method a bit.
# For an explanation on the comparison methods, see solution 1.
def equilateral?(side1, side2, side3)
  (side1 == side2) && (side2 == side3)
end

def isosceles?(side1, side2, side3)
  (((side1 == side2) || (side1 == side3) ||
  (side2 == side3)) && ((side1 != side2) ||
  (side1 != side3) || (side2 != side3)))
end

def invalid?(side1, side2, side3)
  side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
end

# Naming main method triangle_two so we can use seperate test cases.
def triangle_two(side1, side2, side3)
  # In this solution, I want to use case, there is no objective pro, while one con would be length, I just prefer
  # using case for readability. I also think being able to explicity return scalene on an `else` condition may help
  # someone looking at the code realize that if a triangle does not fall under any of the other conditions it must be scalene.
  case
  when invalid?(side1, side2, side3)
    return :invalid
  when equilateral?(side1, side2, side3)
    return :equilateral
  when isosceles?(side1, side2, side3)
    return :isosceles
  else
    return :scalene
  end
end

# Tests:
puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
puts triangle(-1, 1, 1) == :invalid

puts triangle_two(3, 3, 3) == :equilateral
puts triangle_two(3, 3, 1.5) == :isosceles
puts triangle_two(3, 4, 5) == :scalene
puts triangle_two(0, 3, 3) == :invalid
puts triangle_two(3, 1, 1) == :invalid
puts triangle_two(-1, 1, 1) == :invalid


# Solutions without implemetation notes or commented debugging lines:

# Solution 1:

# def equilateral?(side1, side2, side3)
#   (side1 == side2) && (side2 == side3)
# end

# def isosceles?(side1, side2, side3)
#   (((side1 == side2) || (side1 == side3) ||
#   (side2 == side3)) && ((side1 != side2) ||
#   (side1 != side3) || (side2 != side3)))
# end

# def invalid?(side1, side2, side3)
#   side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
# end

# def triangle(side1, side2, side3)
#   return :invalid if invalid?(side1, side2, side3)
#   return :equilateral if equilateral?(side1, side2, side3)
#   return :isosceles if isosceles?(side1, side2, side3)
#   :scalene
# end

#------------------------------------------------------------------------------

#Solution 2:

# def equilateral?(side1, side2, side3)
#   (side1 == side2) && (side2 == side3)
# end

# def isosceles?(side1, side2, side3)
#   (((side1 == side2) || (side1 == side3) ||
#   (side2 == side3)) && ((side1 != side2) ||
#   (side1 != side3) || (side2 != side3)))
# end

# def invalid?(side1, side2, side3)
#   side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
# end

# def triangle_two(side1, side2, side3)
#   case
#   when invalid?(side1, side2, side3)
#     return :invalid
#   when equilateral?(side1, side2, side3)
#     return :equilateral
#   when isosceles?(side1, side2, side3)
#     return :isosceles
#   else
#     return :scalene
#   end
# end
