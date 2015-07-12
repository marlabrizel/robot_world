require 'date'
require_relative 'robot'

class RobotRepository
  def self.database
    if ENV["ROBOT_WORLD_ENV"] == 'test'
      @database ||= Sequel.sqlite('db/robot_repository_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/robot_repository.sqlite3')
    end
  end

  def self.all
    dataset.to_a.map { |data| Robot.new(data)}
  end

  def self.create(robot)
    # begin
      dataset.insert(name: robot[:name],
                     city: robot[:city],
                     state: robot[:state],
                     avatar: robot[:avatar],
                     birthdate: robot[:birthdate],
                     date_hired: robot[:date_hired],
                     department: robot[:department])
    # rescue
    #   return false
    # end
    # Task.new(dataset.to_a.last)
  end

  def self.find(id)
    Robot.new(dataset.where(id: id).first)
  end

  def self.update(id, robot={})
    target = dataset.where(id: id).update(robot)
  end

  def self.delete(id)
    dataset.where(id: id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.dataset
    database.from(:robots)
  end

  def self.average_age
    ages = all.map { |robot| (Date.today - Date.parse(robot.birthdate)).to_i }
    (ages.inject(:+)/all.count)/365
  end
end
