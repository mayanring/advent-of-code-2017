# http://adventofcode.com/2017/day/6

# banks is an array with each element indicating the number of blocks held inside.
def reallocate_memory(banks)
  bank_size = banks.length
  current = banks.slice(0, bank_size)  # no mutations, thanks.
  cache = { current => true }  # we lookup by array
  iterations = 0

  loop do
    # find index with max block, use lowest index in case of tie
    largest = current.each_with_index.reduce(0) do |index_with_largest, (item, index)|
      index_with_largest = index if item > current[index_with_largest]
      index_with_largest
    end

    reallocation_count = current[largest]
    current[largest] = 0

    # reallocate this block's content
    (1..reallocation_count).each do |i|
      current[(largest + i) % bank_size] += 1
    end

    iterations += 1
    # p current
    break if cache.has_key?(current)

    cache[current] = true
  end

  iterations
end

# part two

def find_reallocation_count_from(pattern)
  bank_size = pattern.length
  current = pattern.slice(0, bank_size)  # no mutations, thanks.
  iterations = 0
  cache = { current => iterations }  # we lookup by array

  loop do
    # find index with max block, use lowest index in case of tie
    largest = current.each_with_index.reduce(0) do |index_with_largest, (item, index)|
      index_with_largest = index if item > current[index_with_largest]
      index_with_largest
    end

    reallocation_count = current[largest]
    current[largest] = 0

    # reallocate this block's content
    (1..reallocation_count).each do |i|
      current[(largest + i) % bank_size] += 1
    end

    iterations += 1
    break if cache.has_key?(current)

    cache[current] = iterations
  end

  p "found #{current} at iteration #{cache[current]} and again at iteration #{iterations}"

  iterations - cache[current]
end

def parse_input(input_str)
  input_str.split.map(&:to_i)
end