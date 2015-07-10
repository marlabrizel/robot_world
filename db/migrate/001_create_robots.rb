require 'sequel'
require 'sqlite3'
require './app/models/robot_repository'

environments = %w(test development)

environments.each do |env|
  Sequel.sqlite("db/robot_repository_#{env}.sqlite3").create_table :robots do
    primary_key :id
    String :name
    String :city
    String :state
    String :avatar
    String :birthdate
    String :date_hired
    String :department
  end
  puts "creating robots table for #{env}"
end
