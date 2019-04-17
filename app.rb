require 'sinatra/base'
require 'pg'
require './database_connection_setup'
require './lib/user'

class AirBNB < Sinatra::Base
  enable :sessions


  get '/' do
  		erb :'users/new'
  	end

  post '/sessions' do
    user = User.create(name: params['name'], email: params['email'], password: params['password'], host: params['host'], telefono: params['telefono'])
    session[:user_id] = user.id
    redirect '/'
  end
  run! if app_file == $0
end
