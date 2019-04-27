require_relative 'database_connection'
class SpaceReserva
    
    attr_reader :id_space_reserva, :id_space, :id_reserva

    def initialize(id_space_reserva:, id_space:, id_reserva:)
        @id_space_reserva = id_space_reserva
        @id_space = id_space
        @id_reserva = id_reserva
    end

    def self.create(id_space:, id_reserva:)
        result = DatabaseConnection.query("INSERT INTO space_reserva (id_space, id_reserva) 
                                            VALUES ('#{id_space}','#{id_reserva}') RETURNING id_space_reserva, id_space, id_reserva ;")
        SpaceReserva.new(id_space_reserva: result[0]['id_space_reserva'],
                        id_space: result[0]['id_space'],
                        id_reserva: result[0]['id_reserva'])
    end
end