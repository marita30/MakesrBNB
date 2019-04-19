require_relative './database_connection'

class Categoria

  attr_reader :id, :description

  def initialize (id:, description:)
    @id = id
    @description = description
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM types_space;")
    result.map do | space|
        Categoria.new(id: space['id_categories'], description: space['description'])
    end
  end

end
