# frozen_string_literal: true

require_relative('linked_list/linked_list')

# HashMap Class
class HashMap
  def initialize
    @load_factor = 0.8
    @capacity = 16
    @buckets = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end
end