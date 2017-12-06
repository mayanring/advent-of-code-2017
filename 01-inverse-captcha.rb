# part one
def collect_pairs(digits)
  digits
    .each_with_index
    .map do |digit, index|
      next_digit = digits[(index + 1) % digits.length]
      digit == next_digit ? digit : nil
    end
    .compact
end

def inverse_captcha(input)
  digits = input.split("").map { |digit| digit.to_i }
  collect_pairs(digits).sum
end

# part two
def collect_pairs_with_spacing(digits)
  digits
    .each_with_index
    .map do |digit, index|
      corresponding_index = digits.length / 2
      next_digit = digits[(index + corresponding_index) % digits.length]
      digit == next_digit ? digit : nil
    end
    .compact
end

def inverse_captcha_part_two(input)
  digits = input.split("").map { |digit| digit.to_i }
  collect_pairs_with_spacing(digits).sum
end

# USAGE:

# inverse_captcha(INPUT)
# inverse_captcha_part_two(INPUT)