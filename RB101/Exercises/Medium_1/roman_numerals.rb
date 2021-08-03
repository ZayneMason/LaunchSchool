# Write a method that takes a roman numeral as a string
# and converts it to an integer value

def roman_to_int(roman)
  numerals = { 'I' => '1', 'V' => '5', 'X' => '10', 'L' => '50', 'C' => '100', 'D' => '500', 'M' => '1000'}.freeze

  chars = roman.chars
  numerals.keys.each do |numeral|
    chars.each { |char| char.gsub!(/\b#{numeral}\b/, numerals[numeral]) }
  end

  num_chars = chars.map(&:to_i)

  sum = 0
  num_chars.each_with_index do |char, index|
    sum += char
    next if index.zero?

    sum -= (num_chars[index - 1] * 2) if char > num_chars[index - 1]
  end
  sum
end
