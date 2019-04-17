require 'sinatra/base'
require 'sinatra'
require 'pg'
require_relative './database_connection_setup'
require_relative './lib/user'
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
      flash[:notice] = "Error , Email already exist"
      redirect '/'
    else
      flash[:notice] = "Signup successfully"
      session[:user_id] = user.id
      redirect '/login'
    end
  end

  get '/space/new' do
     erb :'space/new'
  end

  # karel
  get '/login' do
    erb :'users/login'
  end

  post '/login/new' do
    user = User.authenticate(email: params[:email], password: params[:password])
    unless user
      flash[:notice] = 'Username and/or Password are incorrect'
      redirect('/login')
    else
      session[:user_id] = user.id
      flash[:notice] = 'You\'re now log in!'
      redirect('/')
    end
  end
run! if app_file == $0
end
