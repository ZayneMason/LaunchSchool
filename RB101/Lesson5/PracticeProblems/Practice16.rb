# Write a method that returns one UUID when called with no parameters

#Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like
# 8-4-4-4-12, and represented as a string

def uuid_generator
  # Place holder for uuid string
  uuid = ''
  # Going to use a sections array to set how many times to randomly add characters to uuid string
  sections = [8, 4, 4, 4, 12]
  # Settins an array to sample characters from
  letters_and_nums = ('a'..'z').to_a + ('0'..'9').to_a
  sections.each do |values|
    values.times {uuid << letters_and_nums.sample }
    uuid << '-'
  end
  uuid.chop
end

puts uuid_generator
