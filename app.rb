require 'sinatra/base'
require 'sinatra'
require 'pg'
require_relative './database_connection_setup'
require_relative './lib/user'
require_relative './lib/reserva'
require 'sinatra/flash'
require_relative './lib/categoria'
require_relative './lib/space'
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
    @categories = Categoria.all
     erb :'space/new'
  end

  post '/space/new' do
  @userid = session[:user_id]
  @idcategoria = params['id_categories'].to_i
  space = Space.create(name: params['name'], description: params['description'], pricexnight: params['price'], location: params['location'], id_categories: @idcategoria, id_user: @userid)
  flash[:notice] = 'satisfactorily'
  redirect('/space/new')
  end

  post '/sessions/destroy' do
  session.clear
  flash[:notice] = 'You have signed out.'
  redirect('/login')
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

  get '/reserva' do
    erb :'reserva/new'
  end

  post '/reserva/' do
    fechainicio = params[]
    redirect('/reserva/new/:name_user')
  end

  get '/reserva/new/:name_user' do
    params[:name_user] = '' #get the name of the user
    space = '' #Space object

  end

  post '/reserva/new/:name_user' do
    #TODO 
    #view for al the spaces and get the space id.
    space = '' #some Space object 
    #calculate total price
    total = 0 #some how calculate the total
    reserva = Reserva.create(date_inicio: params[:dateinicio],
                            date_final: params[:datefinal],
                            price_total: total,
                            id_request: 1,
                            id_user: session[:user_id])
    space_reserva = SpaceReserva.create(id_space: space.id, id_reserva: reserva.id) 
    redirect("/")
  end
  
run! if app_file == $0
end
