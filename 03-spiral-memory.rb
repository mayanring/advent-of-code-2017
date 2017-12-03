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
