# part one
def generate_spiral(number)
  cache = { 1 => { x: 0, y: 0 } }
  direction = "right"
  distance = 1
  x = 0
  y = 0

  (2..number).each do |i|

    case direction
    when "right"
      if (x + 1).abs <= distance
        x += 1
        cache[i] = { x: x, y: y }
      else
        direction = "up"
        redo
      end

    when "up"
      if (y + 1).abs <= distance
        y += 1
        cache[i] = { x: x, y: y }
      else
        direction = "left"
        redo
      end

    when "left"
      if (x - 1).abs <= distance
        x -= 1
        cache[i] = { x: x, y: y }
      else
        direction = "down"
        redo
      end

    when "down"
      if (y - 1).abs <= distance
        y -= 1
        cache[i] = { x: x, y: y }
      else
        direction = "right"
        distance += 1
        redo
      end

    else
      raise "WAT"
    end

  end

  cache
end

def steps_from_origin(number)
  cache = generate_spiral(number)
  cache[number][:x].abs + cache[number][:y].abs
end


# part two

def neighbor_sum(x, y, cache)
  [
    [x - 1, y + 1],
    [x, y + 1],
    [x + 1, y + 1],
    [x - 1, y],
    [x + 1, y],
    [x - 1, y - 1],
    [x, y - 1],
    [x + 1, y - 1]
  ].reduce(0) do | acc, (xVal, yVal) |
    acc += cache[[xVal, yVal]] if cache.has_key?([xVal, yVal])
    acc
  end
end

# use [x, y] tuples as hash keys
def find_largest_spiral_value(target)
  x, y, value, direction, distance = 0, 0, 1, "right", 1
  cache = { [x, y] => value }

  while value <= target do
    case direction
    when "right"
      if (x + 1).abs <= distance
        x += 1
        value = neighbor_sum(x, y, cache)
        cache[ [x,y] ] = value
      else
        direction = "up"
        redo
      end

    when "up"
      if (y + 1).abs <= distance
        y += 1
        value = neighbor_sum(x, y, cache)
        cache[ [x,y] ] = value
      else
        direction = "left"
        redo
      end

    when "left"
      if (x - 1).abs <= distance
        x -= 1
        value = neighbor_sum(x, y, cache)
        cache[ [x,y] ] = value
      else
        direction = "down"
        redo
      end

    when "down"
      if (y - 1).abs <= distance
        y -= 1
        value = neighbor_sum(x, y, cache)
        cache[ [x,y] ] = value
      else
        direction = "right"
        distance += 1
        redo
      end

    else
      raise "WAT"
    end
  end

  value
end
