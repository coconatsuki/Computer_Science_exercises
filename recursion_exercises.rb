require 'pry'

def pairs(n)
  return [0] if n == 0
  pairs_n_1 = pairs(n-1)
  pairs_n_1 << n if n.even?
  pairs_n_1
end

#p pairs(10)

def sum_pairs(n)
  return 0 if n == 0
  sum = sum_pairs(n-1)
  sum += n if n.even?
  sum
end

#p sum_pairs(10)
#######################################################

def reg(array, regex = /^ch/)
  return [] if array.size == 0
  smaller_array = reg(array[0..-2])
  if array.last =~ regex
    smaller_array << array.last
  end
  smaller_array
end

p reg(['chat', 'chien', 'oiseau', 'vache', 'cheval', 'cochon'])

#######################################################














# prend un argument et renvoie tous les nombres pairs (ou premiers) compris entre 0 et ce nombre (.even ou is_prime)

# prend un array qui contient des strings + regex, renvoie un tableau avec des strings qui ne correspondent qu'aux regex
# de préference, couper le tableau en 2.
