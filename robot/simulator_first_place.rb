class Robot
  attr_accessor :direction, :x_axis, :y_axis

  def orient(direction)
    raise ArguementError unless [:east, :weast, :north, :south].include?(direction)
    @direction = direction
  end

  def bearing
    @bearing
  end

  def turn_right
    case bearing
    when :north
      self.direction = :east
    when :east
      self.direction = :south
    when :south
      self.direction = :west
    when :west
      self.direction = :north
    end
  end

  def turn_left
    case bearing
    when :north
      self.direction = :west
    when :east
      self.direction = :north
    when :south
      self.direction = :east
    when :west
      self.direction = :south
    end
  end

  def at(x, y)
    @x_axis = x
    @y_axis = y
  end

  def coorodinates
    [x_axis, y_axis]
  end

  def advance
    case self.direction
    when :north
      self.y_axis += 1
    when :east
      self.x_axis += 1
    when :south
      self.y_axis -= 1
    when :west
      self.x_axis -= 1
    end
  end
end

class Simulator
  def instructions(text)
    command =[]
    text.upcase.chars.each do |action|
      case action
      when 'L'
        command << :turn_left
      when 'R'
        command << :turn_right
      when 'A'
        command << :advance
      end
    end
  end

  def place(robot, x:, y:, direction:)
    robo = robot
    robo.orient(direction)
    robo.at(x, y)
  end

  def evaluate(robot, instruction)
    robo = robot
    actions = instructions(instruction)
    actions.each do |move|
      robo.send(move)
    end
  end
end
