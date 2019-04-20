require_relative './database_connection'


class Categoria

  attr_reader :id, :description

  def initialize (id:, description:)
    @id = id
    @description = description
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM types_space;")
    result.map do | categoria|
        Categoria.new(id: categoria['id_categories'], description: categoria['description'])
    end
  end

end
