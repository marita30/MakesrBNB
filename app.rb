require 'sinatra/base'
require 'sinatra'
require 'pg'
require './database_connection_setup'
require './lib/user'
require 'sinatra/flash'

class AirBNB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
  		erb :'users/new'
  	end

  post '/sessions' do
    user = User.create(name: params['name'], email: params['email'], password: params['password'], host: params['host'], telefono: params['telefono'])
    if user == nil
      flash[:notice] = "Error , email already exist"
      redirect '/'
    else
      flash[:notice] = "Signup successfully"
      session[:user_id] = user.id
      redirect '/'
    end
  end
  run! if app_file == $0
end
