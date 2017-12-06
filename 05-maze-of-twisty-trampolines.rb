# http://adventofcode.com/2017/day/5

# input given as newline separated offsets
def parse_instructions(instructions_str)
  instructions_str.split("\n").map(&:to_i)
end

def maze_runner(instructions_str)
  instructions = parse_instructions(instructions_str)
  maze_size = instructions.length
  current_step = 0
  iterations = 0

  while (current_step < maze_size && current_step >= 0) do
    jump_offset = instructions[current_step]
    instructions[current_step] += 1
    current_step = current_step + jump_offset
    iterations += 1
  end

  iterations
end

def maze_runner_part_two(instructions_str)
  instructions = parse_instructions(instructions_str)
  maze_size = instructions.length
  current_step = 0
  iterations = 0

  while (current_step < maze_size && current_step >= 0) do
    jump_offset = instructions[current_step]

    if jump_offset >= 3
      instructions[current_step] -= 1
    else
      instructions[current_step] += 1
    end

    current_step = current_step + jump_offset
    iterations += 1
  end

  iterations
end