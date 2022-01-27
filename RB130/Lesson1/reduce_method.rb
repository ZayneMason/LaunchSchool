# Enumerable#reduce is another name for the inject method. It's main goal is to "fold"
# or "accumulate" a collection into 1 object. What the specific folding or accumulation
# mechanism is depends on the code passed in to the block.

# Unlike #each, reduce yields two arguments to the block, the first being the 'accumulator' object,
# and the second being the second being the 'current' object.

def reduce(arr)
  counter = 0
  accumulator = 0
  while counter < arr.size
    accumulator = yield(accumulator, arr[counter])
    counter += 1
  end

  accumulator
end


