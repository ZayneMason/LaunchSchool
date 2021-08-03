def seperator(int)
  chars = int.to_s.chars.reverse.each_slice(3)
  chars.map(&:join).join(',').reverse
end

puts seperator(1000)
puts seperator(100)
puts seperator(990999)
puts seperator(98)

def seperator(int)
  container = []
  chars = int.to_s.chars.reverse.each_slice(3)
  chars.each do |section|
    section << ','
    container << section
  end
  container[-1].pop
  container.join.reverse
end

puts seperator(1000)
puts seperator(100)
puts seperator(990999)
puts seperator(98)