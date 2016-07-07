class Robot
  attr_accessor :bearing,:coordinates
  RIGHT_TURNS = {:north => :east, :south => :west, :east => :south, :west => :north}
  LEFT_TURNS = RIGHT_TURNS.invert

  def orient(bearing)
    raise ArgumentError unless [:north,:south,:east,:west].include?(bearing)
      self.bearing = bearing
  end

  def turn_right
    self.bearing = RIGHT_TURNS[bearing]
  end

  def turn_left
    self.bearing = LEFT_TURNS[bearing]
  end

  def at(x,y)
    self.coordinates = [x,y]
  end

  def advance
    case bearing
    when :north then   coordinates[1] += 1
    when :south then   coordinates[1] -= 1
    when :west then    coordinates[0] -= 1
    when :east then    coordinates[0] += 1
    end
  end
end

class Simulator
  METHODS_HASH = {'L' => :turn_left, 'R' => :turn_right, 'A' => :advance}

  def instructions(str)
    str.split("").map {|letter| METHODS_HASH[letter]}
  end

  def place(robot,args)
    robot.coordinates = [args[:x],args[:y]]
    robot.bearing = args[:direction]
  end

  def evaluate(robot,str)
    instructions(str).each do |method|
      robot.send(method)
    end
  end
end
