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

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'],
                              "name" => robot[:name],
                              "city" => robot[:city],
                              "state" => robot[:state],
                              "avatar" => robot[:avatar],
                              "birthdate" => robot[:birthdate],
                              "date hired" => robot[:date_hired],
                              "department" => robot[:department] }
    end
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end
end
