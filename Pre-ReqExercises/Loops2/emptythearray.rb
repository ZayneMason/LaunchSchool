#Given the array below, use loop to remove and print each name. Stop the loop once names doesn't contain any more elements.
#Keep in mind to only use loop, not while, until, etc.

#given array 
names = ['Sally', 'Joe', 'Lisa', 'Henry']
count = names.size

loop do
  puts names.shift
  break if names.empty?
end