# frozen_string_literal: true

require_relative('linked_list/linked_list')

# HashMap Class
class HashMap
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
    data.each { |entry| set(entry[0], entry[1]) }
  end

  def set(key, value)
    location = hash(key) % @capacity
    list = @buckets[location]
    node = list.find(key)

    if list.contains?(key) && !node.nil?
      list.at(node).value = value
    else
      list.append(key, value)
      @length += 1
    end

    handle_load_factor('add')
  end

  def get(key)
    return nil unless has?(key)

    list = @buckets[hash(key) % @capacity]
    node_index = list.find(key)
    list.at(node_index).value
  end

  def has?(key)
    list = @buckets[hash(key) % @capacity]

    list.contains?(key)
  end

  def remove(key)
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

  def keys(keys = [], index = 0)
    return keys if index >= @capacity

    list = @buckets[index]
    keys = keys.union(list.keys) unless list.size.eql?(0)

    keys(keys, index + 1)
  end

  def values(values = [], index = 0)
    return values if index >= @capacity

    list = @buckets[index]
    values = values.union(list.values) unless list.size.eql?(0)

    values(values, index + 1)
  end

  def entries(entries = [], index = 0)
    return entries if index >= @capacity || @length.zero?

    list = @buckets[index]
    entries = entries.union(list.entries) unless list.size.eql?(0)
    entries(entries, index + 1)
  end
end
