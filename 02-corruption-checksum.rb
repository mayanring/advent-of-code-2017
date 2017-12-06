# parses the input string (rows separated by newlines, data separated by whitespace)
# into an array of arrays.
def parse_row_data_from_input(input_str)
  rows = input_str.split("\n")
  rows.map { |row| row.split.map(&:to_i) }
end

# part one
def greatest_difference(numbers)
  return nil if numbers.empty?

  sorted_numbers = numbers.sort
  (sorted_numbers.first - sorted_numbers.last).abs
end

def calculate_checksum(data)
  data
    .map { |row| greatest_difference(row) }
    .sum
end

# part two
def evenly_divisible_result(row)
  return nil if row.empty?
  sorted_row = row.sort { |a, b| b <=> a }  # descending

  while !sorted_row.empty? do
    divisor = sorted_row.pop

    sorted_row.each do |number|
      if (number % divisor) == 0
        return number / divisor
      end
    end
  end

  nil
end

def calculate_evenly_divisible_sums(data)
  data
    .map { |row| evenly_divisible_result(row) }
    .sum
end