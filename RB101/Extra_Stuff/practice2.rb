# A triangle is classified as follows:
#   equilateral All 3 sides are of equal length
#   isosceles 2 sides are of equal length, while the 3rd is different
#   scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side,
# and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a
# symbol :equilateral, :isosceles, :scalene, or :invalid  depending on whether the triangle is equilateral,
# isosceles, scalene, or invalid.

# Problem:
# -- input: 3 integers reperesenting sides of triangle
# -- output: symbol representing the type of triangle

# Examples: The order of integers does not matter
# should be able to take floats.

# Data structure: floats

# Potential algorithm: setting conditionals to comapare side lengths and determine type of triangle.
# If two sides are == and one not, isosceles, if all sides ==, equilateral, if no sides ==, scalene
# Cannot be isosceles if the two equil sides are shorter than the longest

def equilateral?(side1, side2, side3)
  (side1 == side2) && (side2 == side3)
end

def isosceles?(side1, side2, side3)
  if side1 == side2 && side3 > side1
    false
  elsif side2 == side3 && side1 > side3
    false
  elsif side1 == side3 && side2 > side1
    false
  else
    (((side1 == side2) || (side1 == side3) ||
    (side2 == side3)) && ((side1 != side2) ||
    (side1 != side3) || (side2 != side3)))
  end
end

def scalene?(side1, side2, side3)
  (side1 != side2) && (side2 != side3)
end

def triangle(side1, side2, side3)
  return :invalid if [side1, side2, side3].any?{ |side| side <= 0 }

  return :isosceles if isosceles?(side1, side2, side3)

  return :equilateral if equilateral?(side1, side2, side3)

  return :scalene if scalene?(side1, side2, side3)

 :invalid
end

# Tests:
puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
puts triangle(-1, 1, 1) == :invalid
