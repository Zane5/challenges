#Identify important pieces of knowledge, surface them and make them explicit, instead of hiding them implicitly in steps of execution and manipulation of non-obvious data structures. In this example, the most central decision is how you represent the four directions and how to make left and right turns facing those directions.
#
#Optimize your code for human understanding / clarity, over cleverness or less key strokes. Your code is going to be read many more times than it's written.
#
#Eliminate unnecessary indirections, they always come as a cost.
#
#
class Robot
  attr_reader :bearing

  def orient(direction)
    raise ArgumentError.new('Direction must be one of the following values: :east, :west, :north, :south.') unless [:east, :west, :north, :south].include?(direction)
    @bearing = direction
  end

  def turn_right
    case @bearing
    when :east then @bearing = :south
    when :north then @bearing = :east
    when :south then @bearing = :west
    when :west then @bearing = :north
    end
  end

  def turn_left
    case @bearing
    when :east then @bearing = :north
    when :north then @bearing = :west
    when :west then @bearing = :south
    when :south then @bearing = :east
    end
  end

  def at(x, y)
    @x, @y = x, y
  end

  def coordinates
    [@x, @y]
  end

  def advance
    case @bearing
    when :north then @y += 1
    when :east then @x += 1
    when :west then @x -= 1
    when :south then @y -= 1
    end
  end
end

class Simulator
  def instructions(letter_string)
    letter_string.chars.map do |letter|
      case letter
      when 'L' then :turn_left
      when 'R' then :turn_right
      when 'A' then :advance
      end
    end
  end

  def place(robot, placement)
    robot.at(placement[:x], placement[:y])
    robot.orient(placement[:direction])
  end

  def evaluate(robot, letter_string)
     instructions(letter_string).each { |instruction| robot.send(instruction) }
  end
end
