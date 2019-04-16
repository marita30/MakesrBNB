require 'sinatra'
require_relative 'lib/users'

get '/' do
		'Hola MUndo'
	end

get '/login' do
	erb :login
end

post '/login/new' do

end
