require 'models/robot_repository'

class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

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

  get '/robots/:id/edit' do |id|
    @robot = RobotRepository.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    RobotRepository.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    RobotRepository.delete(id.to_i)
    redirect '/robots'
  end

  not_found do
    erb :error
  end
end
