# Array#each is a method that iterates through the calling array object, and yields each element to a block.
# The return of each is the calling object.

def each(arr)
  counter = 0
  until counter == arr.max
    yield(arr[counter])
    counter += 1
  end

  arr
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end

# 1
# 2
# 3
# 4
# 5
# => [1, 2, 3, 4, 5]

