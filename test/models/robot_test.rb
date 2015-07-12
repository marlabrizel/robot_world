require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({ name: "Velk",
                        city: "Chicago",
                        state: "IL",
                        birthdate: "1985-10-18",
                        date_hired: "2009-05-21",
                        department: "HR",
                        id: 1 })
    assert_equal "Velk", robot.name
    assert_equal "Chicago", robot.city
    assert_equal "IL", robot.state
    assert_equal "1985-10-18", robot.birthdate
    assert_equal "2009-05-21", robot.date_hired
    assert_equal "HR", robot.department
    assert_equal 1, robot.id
  end
end
