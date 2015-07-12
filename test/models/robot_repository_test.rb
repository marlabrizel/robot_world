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
    robot = RobotRepository.find(RobotRepository.all.first.id)
    assert_equal "Velk", robot.name
    assert_equal "IL", robot.state
    assert_equal RobotRepository.all.first.id, robot.id
  end

  def test_it_finds_all_robots
    robots = RobotRepository.all
    assert_equal 2, robots.count
  end

  def test_it_can_update_a_robot
    RobotRepository.update(RobotRepository.all.first.id,
                              { :name       => "Jason Velk",
                                :city       => "Chicago",
                                :state      => "IL",
                                :birthdate  => "1985-10-18",
                                :date_hired => "2009-05-21",
                                :department => "Finance" })
    assert_equal "Jason Velk", RobotRepository.find(RobotRepository.all.first.id).name
    assert_equal "Chicago", RobotRepository.find(RobotRepository.all.first.id).city
    assert_equal "Finance", RobotRepository.find(RobotRepository.all.first.id).department
  end

  def test_it_can_destroy_a_robot
    robots = RobotRepository.all
    assert_equal 2, robots.count
    RobotRepository.delete(RobotRepository.all.last.id)
    robots = RobotRepository.all
    assert_equal 1, robots.count
  end
end
