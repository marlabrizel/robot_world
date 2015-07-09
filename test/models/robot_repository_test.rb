require_relative '../test_helper'

class RobotRepositoryTest < Minitest::Test
  def setup
    RobotRepository.create({ :name       => "Velk",
                             :city       => "Chicago",
                             :state      => "IL",
                             :birthdate  => "1985-10-18",
                             :date_hired => "2009-05-21",
                             :department => "HR" })
    RobotRepository.create({ :name       => "Riley",
                             :city       => "Denver",
                             :state      => "CO",
                             :birthdate  => "2005-02-01",
                             :date_hired => "2005-09-17",
                             :department => "Hospitality" })
  end

  def test_it_creates_a_robot
    robot = RobotRepository.find(1)
    assert_equal "Velk", robot.name
    assert_equal "IL", robot.state
    assert_equal 1, robot.id
  end

  def test_it_finds_all_robots
    robots = RobotRepository.all
    assert_equal 2, robots.count
  end

  def test_it_can_update_a_robot
    RobotRepository.update(1, { :name       => "Jason Velk",
                                :city       => "Chicago",
                                :state      => "IL",
                                :birthdate  => "1985-10-18",
                                :date_hired => "2009-05-21",
                                :department => "Finance" })
    robot = RobotRepository.find(1)
    assert_equal "Jason Velk", robot.name
    assert_equal "Chicago", robot.city
    assert_equal "Finance", robot.department
    assert_equal 1, robot.id
  end

  def test_it_can_destroy_a_robot
    robots = RobotRepository.all
    assert_equal 2, robots.count
    RobotRepository.delete(1)
    robots = RobotRepository.all
    assert_equal 1, robots.count
  end
end
