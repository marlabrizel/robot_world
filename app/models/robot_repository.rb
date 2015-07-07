require 'yaml/store'
require_relative 'robot'

class RobotRepository
  def self.database
    @database ||= YAML::Store.new("db/robot_repository")
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end
end
