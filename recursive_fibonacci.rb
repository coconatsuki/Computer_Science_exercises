require 'pry'

def fibs(n)
  result = []
  (0..n).each do |i|
    i < 2 ? num = 1 : num = result[-1] + result[-2]
    result << num
  end
  result
end

def fibs_rec(n)
  n < 2 ? n : fibs_rec(n-1) + fibs_rec(n-2)
end

def fibs_list(n)
  fibs_list = []
  n.downto(0) do |el|
    fibs_list << fibs_rec(el)
  end
  fibs_list.reverse
end

def fib(n)
  if n < 2
    n
  else
    a = fib(n-1)
    b = fib(n-2)
  end
  array = []
  array[n] = (a + b)
  array
end


p fib(10)
