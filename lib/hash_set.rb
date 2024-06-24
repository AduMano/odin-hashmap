# frozen_string_literal: true

require_relative('linked_list/linked_list')

# HashMap Class
class HashSet
  attr_accessor :buckets, :capacity, :length

  def initialize(load_factor = 0.8)
    @capacity = 16
    @load_factor = load_factor
    @buckets = Array.new(@capacity) { LinkedList.new }
    @length = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def handle_load_factor(type)
    if @length >= (@capacity * @load_factor).round && type.eql?('add')
      data = entries
      @capacity *= 2
      update_bucket(data)
    elsif @length < ((@capacity / 2) * @load_factor).round && @capacity >= 32 && type.eql?('remove')
      data = entries
      @capacity /= 2
      update_bucket(data)
    end
  end

  def update_bucket(data)
    @length = 0
    @buckets = Array.new(@capacity) { LinkedList.new }
    data.each { |entry| add(entry) }
  end

  def add(key)
    key = key.to_s
    location = hash(key) % @capacity
    list = @buckets[location]

    if list.contains?(key) && !list.find(key).nil?
      list.at(list.find(key)).key = key
    else
      list.append(key)
      @length += 1
    end

    handle_load_factor('add')
  end

  def has?(key)
    key = key.to_s
    list = @buckets[hash(key) % @capacity]

    list.contains?(key)
  end

  def remove(key)
    key = key.to_s
    return nil unless has?(key)

    list = @buckets[hash(key) % @capacity]
    node_index = list.find(key)
    @length -= 1
    removed_key = list.remove_at(node_index)
    handle_load_factor('remove')

    removed_key
  end

  def clear
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
    @length = 0
    true
  end

  def entries(keys = [], index = 0)
    if index >= @capacity
      keys.map! { |key| key.to_i.eql?(0) && !key.eql?('0') ? key : key.to_i }
      return keys
    end

    list = @buckets[index]
    keys = keys.union(list.keys) unless list.size.eql?(0)

    entries(keys, index + 1)
  end
end
