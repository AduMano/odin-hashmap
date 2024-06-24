# frozen_string_literal: false

require_relative('../hash_set')

# Test Hash Set (Utilization)
hashset = HashSet.new

puts '#add(1)'.colorize(:gray)
puts '#add(2)'.colorize(:gray)
puts '#add(3)'.colorize(:gray)
puts '#add(4)'.colorize(:gray)
puts '#add(5)'.colorize(:gray)
puts '#add(6)'.colorize(:gray)
puts '#add(7)'.colorize(:gray)
puts '#add(8)'.colorize(:gray)
puts '#add(9)'.colorize(:gray)
puts '#add(10)'.colorize(:gray)
puts '#add(11)'.colorize(:gray)
puts '#add(12)'.colorize(:gray)
puts '#add(13)'.colorize(:gray)
puts '#add(14)'.colorize(:gray)
puts '#add(15)'.colorize(:gray)
puts '#add(16)'.colorize(:gray)
puts '#add("Zero")'.colorize(:gray)

hashset.add(1)
hashset.add(2)
hashset.add(3)
hashset.add(4)
hashset.add(5)
hashset.add(6)
hashset.add(7)
hashset.add(8)
hashset.add(9)
hashset.add(10)
hashset.add(11)
hashset.add(12)
hashset.add(13)
hashset.add(14)
hashset.add(15)
hashset.add(16)
hashset.add('Zero')

puts "\nEntries: #{hashset.entries.to_s.colorize(:yellow)}"
puts "Length: #{hashset.length}".colorize(:gray)
puts "Capacity: #{hashset.capacity}".colorize(:gray)

puts "\n#remove(10)".colorize(:gray)
puts '#remove(12)'.colorize(:gray)

hashset.remove(10)
hashset.remove(12)

puts "\nEntries: #{hashset.entries.to_s.colorize(:yellow)}"
puts "Length: #{hashset.length}".colorize(:gray)
puts "Capacity: #{hashset.capacity}".colorize(:gray)

print "\n#has?('Zero'): "
puts hashset.has?('Zero').to_s.colorize(:yellow)

puts "\n#remove('Zero')".colorize(:gray)
hashset.remove('Zero')

print "\n#has?('Zero'): "
puts hashset.has?('Zero').to_s.colorize(:yellow)

puts "\nEntries: #{hashset.entries.to_s.colorize(:yellow)}"
puts "Length: #{hashset.length}".colorize(:gray)
puts "Capacity: #{hashset.capacity}".colorize(:gray)

puts "\n#remove(11)".colorize(:gray)
hashset.remove(11)
puts '#remove(9)'.colorize(:gray)
hashset.remove(9)

puts "\nEntries: #{hashset.entries.to_s.colorize(:yellow)}"
puts "Length: #{hashset.length}".colorize(:gray)
puts "Capacity: #{hashset.capacity}".colorize(:gray)

puts "\nClear: #{hashset.clear.to_s.colorize(:yellow)}"

puts "\nEntries: #{hashset.entries.to_s.colorize(:yellow)}"
puts "Length: #{hashset.length}".colorize(:gray)
puts "Capacity: #{hashset.capacity}".colorize(:gray)
