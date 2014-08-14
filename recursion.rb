def range(a, b)
  if a > b
    []
  elsif a == b
    [a]
  else
    range(a, b-1) << b
  end
end

def sum array
  if array.length < 2
    array[0]
  else
    array.last+sum(array[0..-2])
  end
end

def recursion2(base, power)
  if power == 0
    1
  elsif power == 1
    base
  elsif power.even?
    result = recursion2(base, power / 2)
    result * result
  else
    recursion2(base, ((power - 1) / 2) ** 2) * base
  end
end

def fibonacci(n)
  if n == 0 || n == 1
    1
  else
    fibonacci(n - 2) + fibonacci(n - 1)
  end
end

def deep_dup(array)
  array.map do |el|
    if el.is_a?(Array)
      deep_dup(el)
    else
      el
    end
  end
end

def binary_search(sorted_array, target)
  if sorted_array.empty?
    nil
  else
    middle_index = sorted_array.length / 2
    if sorted_array[middle_index] == target
      middle_index
    elsif  target > sorted_array[middle_index]
      index = binary_search(sorted_array.drop(middle_index + 1),target)
      return nil if index.nil?
      middle_index + 1 + index
    else
      binary_search(sorted_array.take(middle_index),target)
    end
  end
end
