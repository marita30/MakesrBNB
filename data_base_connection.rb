require 'pg'
# class for connect to DataBase
class DataBaseConnection
  #connect to db
  def self.connect(dbname)
    @connect = PG.connect(dbname: dbname)
  end
  # get connection
  def self.connection
    @connect
  end
  # execute query
  def self.query(sql)
    @connect.exec(sql)
  end
end
