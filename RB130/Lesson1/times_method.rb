# Let's write our own #times method that mimics the behavior of Integer#times.

# Integer#times increments from 0-calling integer, each time passing the integer to a block. Once the incremented integer is calling int - 1,
# the method stops and returns the calling integer.

def times(int)
  # initializing a counter variable at 0 that can be incremented until it == num
  counter = 0
  # setting up a loop that passes the counter to a block and increments the counter until it is int - 1
  while counter < int do
    # yielding to block passed to method and passing counter as an argument
    yield(counter)
    # incrementing counter once block is executed
    counter += 1
  end
  # returning "calling object"
  int
end

times(5) do |num|
  puts num
end
