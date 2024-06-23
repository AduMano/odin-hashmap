# frozen_string_literal: true

require_relative('node')

# Linked List Class
class LinkedList
  attr_accessor :head
  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def append(key, value, new_node = Node.new(key, value), current = @head)
    current.nil? ? @head = new_node : tail.link = new_node

    @size += 1
    true
  end

  def prepend(key, value)
    @head = Node.new(key, value, @head)
    @size += 1
    true
  end

  def tail(current = @head)
    return tail(current.link) unless current.link.nil?

    current
  end

  def at(index, current = @head, accumulator = 0)
    return current if index == accumulator
    return tail if (index + 1) == @size
    return nil if (index + 1) > @size

    at(index, current.link, accumulator + 1)
  end

  def pop(last_node = tail, current = @head)
    if current.link.eql?(last_node)
      disposed_node = current.link
      current.link = nil
      @size -= 1
      disposed_node
    else
      pop(last_node, current.link)
    end
  end

  def contains?(key)
    find(key) ? true : false
  end

  def find(key, index = 0, current = @head)
    return index if current.key.eql?(key)
    return nil if current.link.nil?

    find(key, index + 1, current.link)
  end

  def to_s(current = @head, output = '')
    return output << 'nil' if current.nil?

    output += "(#{current.key}: #{current.value}) -> "
    to_s(current.link, output)
  end

  def insert_at(key, value, index, accumulator = 0, current = @head)
    return prepend(key, value) if index.zero?
    return false if (index + 1) > @size

    if index.eql?(accumulator + 1)
      current.link = Node.new(key, value, current.link)
      @size += 1
      true
    else
      insert_at(key, value, index, accumulator + 1, current.link)
    end
  end

  def remove_at(index, accumulator = 0, current = @head) # rubocop:disable Metrics/MethodLength
    return false if (index + 1) > @size

    if index.eql?(0)
      @head = current.link
      @size -= 1
      return true
    elsif index.eql?(accumulator + 1)
      current.link = current.link.link
      @size -= 1
      return true
    end

    remove_at(index, accumulator + 1, current.link)
  end
end
