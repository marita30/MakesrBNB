require 'bcrypt'
require_relative './database_connection'
class User
  attr_reader :id , :name, :email, :telefono , :host

  def initialize(id:, name:, email:, telefono:, host:)
    @id = id
    @name = name
    @email = email
    @telefono = telefono
    @host = host
  end
  def self.create(name:, email:, password:, telefono:, host:)
    if host == "true"
      value_host = true
    end
    value_host = false
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO usuario (name,email,password,host,telefono) VALUES ('#{name}','#{email}','#{encrypted_password}','#{value_host}','#{telefono}') RETURNING id, name, email, telefono, host;")
    p result
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], telefono: result[0]['telefono'], host: result[0]['host'])
  end

end
