require 'sinatra/base'
require 'sinatra'
require 'pg'
require 'date'
require_relative './database_connection_setup'
require_relative './lib/user'
require_relative './lib/reserva'
require 'sinatra/flash'
require_relative './lib/categoria'
require_relative './lib/space'
class AirBNB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/users/new' do
  		erb :'users/new'
  	end

  post '/sessions' do
    user = User.create(name: params['name'], email: params['email'], password: params['password'], host: params['host'], telefono: params['telefono'])
    if user == nil
      flash[:notice] = "Error , Email already exist"
      redirect '/users/new'
    else
      flash[:notice] = "Signup successfully"
      session[:user_id] = user.id
      redirect '/'
    end
  end

  get '/' do
    @user = User.find(id: session[:user_id])
    erb :'space/index'
  end

  get '/space/new' do
    @user = User.find(id: session[:user_id])
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

  get '/reserva/:id_space' do
    @user = session[:user_id]
    @id_space = params[:id_space]
    erb :'reserva/new'
  end

  get '/reserva/new/:id_user/:id_space' do
    space = Space.find(id: params[:id_space])
    user = User.find(id: params[:id_user])
    erb :'reserva/create'
  end

  post '/reserva/new/:id_user/:id_space' do
    #TODO
    #view for al the spaces and get the space id
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

 # para imprimir la lista de space
 
  get '/space/:id_space' do
    @space = Space.find(id: params['id_space'])
    @space_categoria = Categoria.find(id: @space.id_categories)
    erb :'space/show'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'space/list'
  end


run! if app_file == $0
end
