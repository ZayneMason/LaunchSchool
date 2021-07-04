# Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each do |name|
  while name.size > 3
    name.chop!
  end
end
puts flintstones

# Or much more efficiently:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0,3]}
puts flintstones

#.map modifies each value in an array and returns a new or original array based on !