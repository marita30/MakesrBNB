require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'AirBNB_test')

      DatabaseConnection.setup('AirBNB_test')
    end
    it 'this connection is persistent' do
      connection  = DatabaseConnection.setup('AirBNB_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'execute a query via PG' do
      connection = DatabaseConnection.setup('AirBNB_test')
      expect(DatabaseConnection.connection).to eq connection
      DatabaseConnection.query("SELECT * FROM usuario;")
    end
  end
end
