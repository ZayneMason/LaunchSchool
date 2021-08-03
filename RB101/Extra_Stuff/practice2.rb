# A triangle is classified as follows:
#   equilateral All 3 sides are of equal length
#   isosceles 2 sides are of equal length, while the 3rd is different
#   scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side,
# and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a
# symbol :equilateral, :isosceles, :scalene, or :invalid  depending on whether the triangle is equilateral,
# isosceles, scalene, or invalid.

# Problem: based 3 integers representing side lengths, applying triangular formulas, such as if all lengths are the same,
# its equilateral.

# Examples: The order of integers does not matter
# should be able to take floats.

# Data structure: floats

# Potential algorithm: setting conditionals to comapare side lengths and determine type of triangle.
# If two sides are == and one not, isosceles, if all sides ==, equilateral, if no sides ==, scalene
# Cannot be isosceles if the two equil sides are shorter than the longest

def equilateral?(side1, side2, side3)
  (side1.to_f == side2.to_f) && (side2.to_f == side3.to_f)
end

def isosceles?(side1, side2, side3)
  if side1.to_f == side2.to_f && side3.to_f > side1.to_f
    false
  elsif side2.to_f == side3.to_f && side1.to_f > side3.to_f
    false
  elsif side1.to_f == side3.to_f && side2.to_f > side1.to_f
    false
  else
    (((side1.to_f == side2.to_f) || (side1.to_f == side3.to_f) ||
    (side2.to_f == side3.to_f)) && ((side1.to_f != side2.to_f) ||
    (side1.to_f != side3.to_f) || (side2.to_f != side3.to_f)))
  end
end

def scalene?(side1, side2, side3)
  (side1.to_f != side2.to_f) && (side2.to_f != side3.to_f)
end

def triangle(side1, side2, side3)
  return :invalid if side1 <= 0 || side2 <= 0 || side3 <= 0

  return :isosceles if isosceles?(side1.to_f, side2.to_f, side3.to_f)

  return :equilateral if equilateral?(side1.to_f, side2.to_f, side3.to_f)

  return :scalene if scalene?(side1.to_f, side2.to_f, side3.to_f)

 :invalid
end

# Tests:
puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
puts triangle(-1, 1, 1) == :invalid
