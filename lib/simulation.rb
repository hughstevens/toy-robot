require './lib/table'
require './lib/robot'

class Simulation
  attr_reader :table
  attr_reader :robot

  def initialize(table: Table.new, robot: Robot.new)
    @table = table
    @robot = robot
  end

  def table_position_available?(x_position:, y_position:)
    table.x_range.include?(x_position) && table.y_range.include?(y_position)
  end

  def place_robot(x_position:, y_position:, orientation:)
    robot.x_position = x_position
    robot.y_position = y_position
    robot.orientation = orientation
  end

  def robot_placed?
    !!robot.orientation
  end

  def current_robot_position
    robot.position
  end

  def next_robot_position
    current_robot_position.merge(robot.range) do |_, current_position, range|
      current_position + range
    end
  end
end
