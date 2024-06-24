# frozen_string_literal: true

# Class Node
class Node
  attr_accessor :link, :key, :value

  def initialize(key, value = nil, link = nil)
    @key = key
    @value = value

    @link = link
  end
end
