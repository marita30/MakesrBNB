require_relative '../data_base_connection.rb'
require 'bcrypt'

class User
  def.authenticate(email:, pass:)

  end

  attr_reader :email, :pass

  def initialize(email:, pass:)
    @email = email
    @pass = pass
  end
end
