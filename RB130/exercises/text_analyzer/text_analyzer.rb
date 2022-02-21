# Fill out the rest of the Ruby code below so it prints output like that shown in "Sample Output." 
# You should read the text from a simple text file that you provide. 

# Read the text file in the #process method and pass the text to the block provided in each call.
# Everything you need to work on is either part of #process or part of the blocks.

class TextAnalyzer
  def process
    file = File.open('sample_text.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").count} lines" }
analyzer.process { |file| puts "#{file.split(' ').count } words" }

# Sample output:
# 3 paragraphs
# 15 lines
# 126 words