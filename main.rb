# frozen_string_literal: false

require('colorize')
require_relative('lib/hash_map')

# Initialize HashMap
hashmap = HashMap.new(0.8)

# Set Keys and Values
puts '> #set(key, value) ========================================='.colorize(:red)
puts 'set("name", "Aldwin")'
puts 'set("age", 21)'
hashmap.set('name', 'Aldwin')
hashmap.set('age', 21)

## Updates the existing Key
puts 'Update existing key\'s value'.colorize(:gray)
puts 'set("name", "Dylan")'
hashmap.set('name', 'Dylan')

# Get Value
puts "\n> #get(key) ================================================".colorize(:red)
print 'get("name"): '
puts hashmap.get('name').colorize(:yellow)
print 'get("age"): '
puts hashmap.get('age').to_s.colorize(:yellow)

# Has?
puts "\n> #has?(key) ================================================".colorize(:red)
print 'has?("name"): '
puts hashmap.has?('name').to_s.colorize(:yellow)
print 'has?("age"): '
puts hashmap.has?('age').to_s.colorize(:yellow)
print 'has?("height"): '
puts hashmap.has?('height').to_s.colorize(:yellow)

# Remove Key
puts "\n> #remove(key) ==============================================".colorize(:red)
removed_key = hashmap.remove('age')
print 'remove("age"): '
puts [removed_key.key, removed_key.value].to_s.colorize(:yellow)

## Check using #has?(key)
print 'has?("age"): '
puts hashmap.has?('age').to_s.colorize(:yellow)

## Get using #get(key)
age = hashmap.get('age')
print 'get("age"): '
puts (age.nil? ? 'nil' : age).to_s.colorize(:yellow)

# Length
puts "\n> #length ===================================================".colorize(:red)
print 'length: '
puts hashmap.length.to_s.colorize(:yellow)
print 'Capacity: '.colorize(:gray)
puts hashmap.capacity.to_s.colorize(:gray)

# Clear
puts "\n> #clear ====================================================".colorize(:red)
print 'clear: '
puts hashmap.clear.to_s.colorize(:yellow)

## Check using #length
print 'length: '.colorize(:gray)
puts hashmap.length.to_s.colorize(:gray)
print 'Capacity: '.colorize(:gray)
puts hashmap.capacity.to_s.colorize(:gray)

# Set Keys and Values then Get Keys
puts "\n> #keys & #values ============================================".colorize(:red)
puts 'set("name", "Aldwin")'
puts 'set("age", 21)'
puts 'set("citizenship", "Filipino")'
hashmap.set('name', 'Aldwin')
hashmap.set('age', 21)
hashmap.set('citizenship', 'Filipino')

## Get Keys
print 'keys: '
puts hashmap.keys.to_s.colorize(:yellow)

## Get Values
print 'values: '
puts hashmap.values.to_s.colorize(:yellow)

# Entries
puts "\n> #entries ===================================================".colorize(:red)
print 'entries: '
puts hashmap.entries.to_s.colorize(:yellow)

## Check using #length
print 'length: '.colorize(:gray)
puts hashmap.length.to_s.colorize(:gray)
print 'Capacity: '.colorize(:gray)
puts hashmap.capacity.to_s.colorize(:gray)

# Test Cases
puts "\n> Test Cases =================================================".colorize(:red)
hashmap.clear
puts "set('name', 'Zero')".colorize(:gray)
puts "set('code_name', 'Hero')".colorize(:gray)
puts "set('series', 'Megaman Zero')".colorize(:gray)
puts "set('franchise', 'Megaman')".colorize(:gray)
puts "set('vitality_points', 64)".colorize(:gray)
puts "set('elf', 'Croire')".colorize(:gray)
puts "set('hair_color', 'yellow')".colorize(:gray)
puts "set('navigator', 'Ciel')".colorize(:gray)
puts "set('head_part', 'Quick Charge')".colorize(:gray)
puts "set('body_part', 'Rolling')".colorize(:gray)
puts "set('foot_part', 'Double Jump')".colorize(:gray)
puts "set('game_mode', 'Hard')".colorize(:gray)

hashmap.set('name', 'Zero')
hashmap.set('code_name', 'Hero')
hashmap.set('series', 'Megaman Zero')
hashmap.set('franchise', 'Megaman')
hashmap.set('vitality_points', 64)
hashmap.set('elf', 'Croire')
hashmap.set('hair_color', 'yellow')
hashmap.set('navigator', 'Ciel')
hashmap.set('head_part', 'Quick Charge')
hashmap.set('body_part', 'Rolling')
hashmap.set('foot_part', 'Double Jump')
hashmap.set('game_mode', 'Ultimate Mode')

print "\nentries: "
puts hashmap.entries.to_s.colorize(:yellow)

## Check using #length
print 'length: '.colorize(:gray)
puts hashmap.length.to_s.colorize(:gray)
print 'Capacity: '.colorize(:gray)
puts hashmap.capacity.to_s.colorize(:gray)

puts "set('main_weapon', 'Z-Sabre')".colorize(:gray)
puts "set('sub_weapon', 'Z-Buster')".colorize(:gray)

hashmap.set('main_weapon', 'Z-Sabre')
hashmap.set('sub_weapon', 'Z-Buster')

print "\nentries: "
puts hashmap.entries.to_s.colorize(:yellow)

## Check using #length
print 'length: '.colorize(:gray)
puts hashmap.length.to_s.colorize(:gray)
print 'Capacity: '.colorize(:gray)
puts hashmap.capacity.to_s.colorize(:gray)

## Remove 2 keys
removed_key = hashmap.remove('game_mode')
print 'remove("game_mode"): '
puts [removed_key.key, removed_key.value].to_s.colorize(:yellow)

removed_key = hashmap.remove('franchise')
print 'remove("franchise"): '
puts [removed_key.key, removed_key.value].to_s.colorize(:yellow)

print "\nentries: "
puts hashmap.entries.to_s.colorize(:yellow)

## Check using #length
print 'length: '.colorize(:gray)
puts hashmap.length.to_s.colorize(:gray)
print 'Capacity: '.colorize(:gray)
puts hashmap.capacity.to_s.colorize(:gray)
