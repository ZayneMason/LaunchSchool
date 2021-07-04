# In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

puts flintstones.index {|name| name[0..1] == 'Be'}

# .index finds the first index to match the criteria given in argument or block
