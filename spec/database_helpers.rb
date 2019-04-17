require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'AirBNB_test')
	result = connection.query("SELECT * FROM #{table} WHERE id_user = '#{id}';")
end
