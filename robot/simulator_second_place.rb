class Simulator
  INSTRUCTIONS_DICT = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def instructions(instruction_code)
    instruction_code.each_char.map { |char| INSTRUCTIONS_DICT[char] }
  end

  def place(robot, placement)
    robot.at(placement[:x], placement[:y])
    robot.orient(placement[:direction])
  end

  def evaluate(robot, instruction_code)
    instructions(instruction_code).each { |instruction| robot.send(instruction) }
  end
end

class Robot
  attr_accessor :bearing, :coordinates
  BEARINGS = [:north, :east, :south, :west, :north]

  def initialize
    @bearing = :unorientated
    @coordinates = [0, 0]
  end

  def orient(direction)
    raise ArgumentError.new unless BEARINGS.include?(direction)
    self.bearing = direction
  end

  def turn_right
    self.bearing = BEARINGS[BEARINGS.find_index(self.bearing) + 1]
  end

  def turn_left
    self.bearing = BEARINGS.reverse[BEARINGS.reverse.find_index(self.bearing) + 1]
  end

  def at(x, y)
    self.coordinates = [x, y]
  end

  def advance
    self.coordinates[0] += 1 if bearing == :east
    self.coordinates[0] -= 1 if bearing == :west
    self.coordinates[1] += 1 if bearing == :north
    self.coordinates[1] -= 1 if bearing == :south
  end
end
