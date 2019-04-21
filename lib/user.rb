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
    else
      value_host = false
    end
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO usuario (name,email,password,host,telefono) VALUES ('#{name}','#{email}','#{encrypted_password}','#{value_host}','#{telefono}') RETURNING id_user, name, email, telefono, host;")
    User.new(id: result[0]['id_user'], name: result[0]['name'], email: result[0]['email'], telefono: result[0]['telefono'], host: result[0]['host'])
    rescue PG::Error => err
      if err.error
        return
      end
  end

  def self.authenticate(email:, password:)
    resultset = DatabaseConnection.query("SELECT * FROM usuario WHERE email = '#{email}';")
    return unless resultset.any?
    return unless BCrypt::Password.new(resultset[0]['password']) == password
    User.new(id: resultset[0]['id_user'],
            name: resultset[0]['name'],
            email: resultset[0]['email'],
            telefono: resultset[0]['telefono'],
            host: resultset[0]['host'])
  end

  def self.find(id: )
    result = DatabaseConnection.query("SELECT * FROM usuario WHERE id_user = '#{id}';")
    return unless result.any?
    User.new(id: result[0]['id_user'],
            name: result[0]['name'],
            email: result[0]['email'],
            telefono: result[0]['telefono'],
            host: resultset[0]['host'])
  end

end
