# Write a method that rotates an array so that the first element is moved to the end 
# of the array. The original array should not be modified.
# do not use Array#rotate or #rotate! in this exercise.

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

# Tests:
puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

array = [1, 2, 3]
rotate_array(array)
array
