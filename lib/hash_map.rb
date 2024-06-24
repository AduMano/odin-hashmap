# frozen_string_literal: true

require_relative('linked_list/linked_list')

# HashMap Class
class HashMap
  attr_accessor :buckets, :capacity

  def initialize(load_factor = 0.8)
    @capacity = 16
    @load_factor = load_factor
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def handle_load_factor
    if length >= (@capacity * @load_factor).round
      @capacity *= 2
      update_capacity
    elsif length < ((@capacity / 2) * @load_factor).round && @capacity >= 32
      @capacity /= 2
      update_capacity
    end
  end

  def update_capacity
    buckets_copy = @buckets.clone
    @buckets = Array.new(@capacity) do |index|
      @buckets[index] = buckets_copy[index].nil? ? LinkedList.new : buckets_copy[index]
    end
  end

  def set(key, value)
    location = hash(key) % @capacity
    list = @buckets[location]

    if list.contains?(key)
      node = list.find(key)
      node.nil? ? list.append(key, value) : list.at(node).value = value
    else
      list.append(key, value)
    end

    handle_load_factor
  end

  def get(key)
    return nil unless has?(key)

    list = @buckets[hash(key) % @capacity]
    node_index = list.find(key)
    list.at(node_index).value
  end

  def has?(key)
    list = @buckets[hash(key) % @capacity]
    puts hash(key) % @capacity
    puts @buckets.length

    list.contains?(key)
  end

  def remove(key)
    return nil unless has?(key)

    list = @buckets[hash(key) % @capacity]
    node_index = list.find(key)
    handle_load_factor

    list.remove_at(node_index)
  end

  def length(size = 0, index = 0)
    return size + @buckets[index].size if index.eql?(@capacity - 1)

    length(size + @buckets[index].size, index + 1)
  end

  def clear
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }

    true
  end

  def keys(keys = [], index = 0)
    return keys if index >= @capacity

    list = @buckets[index]
    keys = keys.union(list.keys) unless list.size.zero? # rubocop:disable Style/ZeroLengthPredicate

    keys(keys, index + 1)
  end

  def values(values = [], index = 0)
    return values if index >= @capacity

    list = @buckets[index]
    values = values.union(list.values) unless list.size.zero?

    values(values, index + 1)
  end

  def entries(entries = [], index = 0)
    return entries if index >= @capacity

    list = @buckets[index]
    entries = entries.union(list.entries) unless list.size.zero?
    entries(entries, index + 1)
  end
end
