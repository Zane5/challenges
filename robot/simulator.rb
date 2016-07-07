class Robot
  def orient(direction)
    raise ArgumentError.new('Direction must be one of the following values: :east, :west, :north, :south.') unless [:east, :west, :north, :south].include?(direction)
    @bearing = direction
  end

  def bearing
    @bearing
  end

  def turn_right
    if @bearing == :east
      @bearing = :south
    elsif @bearing == :south
      @bearing = :west
    elsif @bearing == :west
      @bearing = :north
    elsif @bearing == :north
      @bearing = :east
    end
  end
  
  def turn_left
    if @bearing == :east
      @bearing = :north
    elsif @bearing == :south
      @bearing = :east
    elsif @bearing == :west
      @bearing = :south
    elsif @bearing == :north
      @bearing = :west
    end
  end

  def at(x, y)
    @x, @y = x, y
  end

  def coordinates
    [@x, @y]
  end

  def advance
    if @bearing == :north
      @y += 1
    elsif @bearing == :east
      @x += 1
    elsif @bearing == :south
      @y -= 1
    elsif @bearing == :west
      @x -= 1
    end
  end
end

class Simulator
  def instructions(letter_string)
    letter_string.chars.map do |letter|
      if letter == 'L'
        :turn_left
      elsif letter == 'R'
        :turn_right
      elsif letter == 'A'
        :advance
      end
    end
  end

  def place(robot, position_data)
    robot.at(position_data[:x], position_data[:y])
    robot.orient(position_data[:direction])
  end

  def evaluate(robot, letter_string)
    instructions(letter_string).each do |instruction|
      robot.send(instruction)
    end
  end
end

