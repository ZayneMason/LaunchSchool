# Write a method that takes a sentence string as an input, and returns the same string
# with any words that have a number equivalent (one, 1) turned into digits.
def to_digits(str)
  digit_words = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
                  'five' => '5', 'six' => '6', 'seven' => '7',
                  'eight' => '8', 'nine' => '9', 'zero' => '0' }.freeze
  digit_words.keys.each do |word|
    str.gsub!(/\b#{word}\b/, digit_words[word])
  end
  str
end

puts to_digits('Can I get five pizzas and three cokes')
