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
# -- assign values in our new array's rows by pointing to original array's values in order to transpose the matrix
# ---- 1st array containts the values at index 0 in each of the previous arrays,
# ---- 2nd is index 1 values, and 3rd is the index 2 values

# Solution 1:

def transpose(nested_arr)
  transposed_arr = []
  # Using each_with_index on both nested array and interior array elements should not be destructive to the original values.
  # Using the index of the current array, we can reverse how the values are assigned, for example, we want to take the
  # values located at [0][0..2] in the argument array and in the transposed array place them at [0..2][0],
  # turning rows into columns.
  nested_arr.each_with_index do | arr, arr_index |
    # Setting a new_row empty array will allow us to append our located values to it and append it to transposed_arr.
    # Because it is inside of the each_with_index block, it will reset to empty each time we move to a new array
    new_row=[]
    ## p previous_arr_index
    # We already have the index of the array we are looking at, but we need to get the index of the value we are on in order to
    # swap the value's index and array index to get the value in the argument array we want to append into our new_row.
    arr.each_with_index do | _ , value_index |
      # Each time we go over an element in the current argument sub-array,
      # we can assign a value to append to the new_row that points to our desired value
      # from the argument array.
      # Our desired location would be flipping the array and value index
      # -- example: we want [1][0] in our new array to be the value at [0][1] in the argument array
      value = nested_arr[value_index][arr_index]
      ## p value
      new_row << value
    end
    # each time we complete our iteration over a sub array we need to append the `new_row` to our transposed array
    ## p new_row
    transposed_arr << new_row
  end
  ## p transposed_arr
  transposed_arr
end

# Solution 2:

#naming method transposed_two so we can create tests seperate from the original solution.
def transpose_two(nested_arr)
  # In this solution we are going to again use a new array, however we aren't going to iterate at all.
  # We can actually just hard-code appending new sub arrays to it where each value would point to the
  # value in the argument array manually with the same logic of flipping the array index and value index
  # in order to create columns from the original rows of the matrix.
  # Pros: Easier to read and we get a visual of the matrix line by line
  # Cons: If we wanted scalability it would not work, as this solution assumes that matrix will always be 3 x 3
  # ----- while the previous can be adjusted easily to work with any size.
  transposed_arr = []
  transposed_arr << [nested_arr[0][0], nested_arr[1][0], nested_arr[2][0]]
  transposed_arr << [nested_arr[0][1], nested_arr[1][1], nested_arr[2][1]]
  transposed_arr << [nested_arr[0][2], nested_arr[1][2], nested_arr[2][2]]
  ## p transposed_arr
  transposed_arr
end

# Test Cases: 
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)
new_matrix_two = transpose_two(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p new_matrix_two == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Both solutions without implementation notes or commented debugging lines:

# Solution 1:

# def transpose(nested_arr)
#   transposed_arr = []
#   nested_arr.each_with_index do | arr, arr_index |
#     new_row=[]
#     arr.each_with_index do | _ , value_index |
#       value = nested_arr[value_index][arr_index]
#       new_row << value
#     end
#     transposed_arr << new_row
#   end
#   transposed_arr
# end

#---------------------------------------------------------------------------

# Solution 2:

# def transpose_two(nested_arr)
#   transposed_arr = []
#   transposed_arr << [nested_arr[0][0], nested_arr[1][0], nested_arr[2][0]]
#   transposed_arr << [nested_arr[0][1], nested_arr[1][1], nested_arr[2][1]]
#   transposed_arr << [nested_arr[0][2], nested_arr[1][2], nested_arr[2][2]]
#   transposed_arr
# end
