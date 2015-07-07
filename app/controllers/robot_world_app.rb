require 'models/robot_repository'

class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = RobotRepository.all
    erb :index
  end
end
