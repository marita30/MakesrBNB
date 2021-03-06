
require_relative './database_connection'
class Space
  attr_reader :id, :name, :description, :pricexnight, :location, :id_categories, :id_user

  def initialize(id:, name:, description:, pricexnight:, location:, id_categories:, id_user:)
    @id = id
    @name = name
    @description = description
    @pricexnight = pricexnight
    @location = location
    @id_categories = id_categories
    @id_user = id_user
  end

  def self.create(name:, description:, pricexnight:, location:, id_categories:, id_user:)
    result = DatabaseConnection.query("INSERT INTO space (name, description, pricexnight, location, id_categories, id_user) VALUES('#{name}', '#{description}','#{pricexnight}','#{location}','#{id_categories}','#{id_user}') RETURNING id_space,name,description,pricexnight,location,id_categories,id_user;")
    Space.new(id: result[0]['id_space'], name: result[0]['name'], description: result[0]['description'], pricexnight: result[0]['pricexnight'], location: result[0]['location'], id_categories: result[0]['id_categories'], id_user: result[0]['id_user'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM space WHERE id_space = '#{id}';")
    Space.new(id: result[0]['id_space'],
              name: result[0]['name'],
              description: result[0]['description'],
              pricexnight: result[0]['pricexnight'],
              location: result[0]['location'],
              id_categories: result[0]['id_categories'],
              id_user: result[0]['id_user'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM space;")
    result.each do |space|
      Space.new(id: space['id_space'],
              name: space['name'],
              description: space['description'],
              pricexnight: space['pricexnight'],
              location: space['location'],
              id_categories: space['id_categories'],
              id_user: space['id_user'])
      end
  end

end
