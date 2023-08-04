# frozen_string_literal: true

# Enumberable module

module Enumerable
  # Your code goes here
  def my_all?
    size.times do |i|
      return false unless yield(self[i])
    end
    true
  end

  def my_any?
    size.times do |i|
      return true if yield(self[i])
    end
    false
  end

  def my_count
    return size unless block_given?

    count = 0
    size.times do |i|
      count += 1 if yield(self[i])
    end
    count
  end

  def my_each_with_index
    size.times do |i|
      yield(self[i], i)
    end
    self
  end

  def my_inject(initial_value)
    size.times do |i|
      initial_value = yield(initial_value, self[i])
    end
    initial_value
  end

  def my_map(method = nil)
    result = []
    if method
      size.times { |i| result[i] = method.call(self[i]) }
    else
      size.times { |i| result[i] = yield(self[i]) }
    end
    result
  end

  def my_none?
    size.times do |i|
      return false if yield(self[i])
    end
    true
  end

  def my_select
    result = []
    size.times do |i|
      result << self[i] if yield(self[i])
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    size.times do |i|
      yield(self[i])
    end
    self
  end

  # Define my_each here
end
