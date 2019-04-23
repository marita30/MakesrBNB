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

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM types_space WHERE id_categories = '#{id}';")
    p result
    Categoria.new(id: result[0]['id_categories'], description: result[0]['description'])
  end
end
