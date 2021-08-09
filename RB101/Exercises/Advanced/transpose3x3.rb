# A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements
# For example:

# 1  5  8
# 4  7  2
# 3  9  6

# Can be described by the array of arrays as:

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.
# To access an element in matrix, you use Array#[] with both the row index and column index.
# So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9.
# An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2].
# Unfortunately, there's no convenient notation for accessing an entire column.
# The transpose of a 3 x 3 matrix is that matrix that results from exchanging the columns and rows of the original matrix.

# For example, the transposition of the array shown above is:
# 1  4  3
# 5  7  9
# 8  2  6

# Write a method that takes a 3x3 matrix in an array of arrays and returns the transpose of the original matrix. 
# Nother that there is a Array#transpose method that does this. 
# You may not use it in this exercise. You are also not allowed to use the Matrix class.
# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

# Problem: 
# -- input : nested array
# -- output : new nested array
# -- looking at the input and output visually we can imagine the array elements as horizontal rows in a matrix
# -- what we are doing is turning these rows into vertical columns in the same order i.e. (row 1 == column 1)
# -- in actual array terms, we need to create a new nested array in which the array elements contain the values re-ordered,
#     and/or swapped from other array elements to fit this rotation


# Examples :
# -- I can see that array[0][0], array[1][1], and array[2][2], do not change, and are also the diagonal starting from top left
# -- If we visually look at the rotation of the rows as a matrix rather than arrays, we can see that the transposed output arrays
#    maintain their order vertically rather than horizontally, we can look at the top row(matrix[0]) array elements in the output as the first
#    elemenent in each vertical column.

# Data structure:
# -- nested arrays

# Algorithm/logic:
# -- create an array that we will use as our return
# -- reassign values of array elements in duplicate by pointing to original array's values in order to transpose the matrix
# ---- 1st array containts the values at index 0 for each previous array, 2nd is index 1 values, and 3 is the index 2 values


def transpose(nested_arr)
  transposed_arr = []
  current_row = 0
  nested_arr.each do |arr|
    add_row = []
    add_row << arr[current_row] 
  end
  puts add_row
end

transpose([[1, 4, 3], [5, 7, 9], [8, 2, 6]])


# # Test Cases: 
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]