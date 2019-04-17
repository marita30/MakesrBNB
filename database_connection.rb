require './lib/database_connection'

if ENV['ENVIROMENT'] == 'test'
  DatabaseConnection.setup('AirBNB_test')
else
  DatabaseConnection.se tup('AirBNB')
end
