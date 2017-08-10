def merge(array_1, array_2)
  sorted_array = []
  while !(array_1.empty? || array_2.empty?)
    if array_1.first < array_2.first
      sorted_array << array_1.shift
    else
      sorted_array << array_2.shift
    end
  end
  sorted_array << array_1 unless array_1.empty?
  sorted_array << array_2 unless array_2.empty?
  sorted_array.flatten
end

def divide(array)
  return array if array.size == 1
  a = divide(array.slice!(0..((array.length - 1) / 2)))
  b = divide(array)
  result = merge(a, b)
end

p divide([5, 8, 2, 7, 9, 3, 1, 4, 6])
