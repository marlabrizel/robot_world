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

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    RobotRepository.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = RobotRepository.find(id.to_i)
    erb :show
  end
end
