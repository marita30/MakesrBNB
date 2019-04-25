require_relative './database_connection'

class Reserva
    
    def self.create(date_inicio:, date_final:, price_total:, id_request:, id_user:)
        result = Database_Connection.query("INSERT INTO reservas(date_inicio, date_final, price_total, id_request, id_user)
         VALUES ('#{}','#{}','#{}','#{}','#{}') RETURNING id_reservas, date_inicio, date_final, price_total, id_request, id_user ;")
        Reserva.new(id: result[0]['id_reservas'],
                    date_inicio: result[0]['date_inicio'],
                    date_final: result[0]['date_final'],
                    price_total: result[0]['price_total'],
                    id_request: result[0]['id_request'],
                    id_user: result[0]['id_user'])
    end

    attr_reader :id, :date_inicio, :date_final, :price_total, :id_request, :id_user

    def initialize(id:, date_inicio:, date_final:, price_total:, id_request:, id_user:)
        @id = id
        @date_inicio = date_inicio
        @date_final = date_final
        @price_total = price_total
        @id_request = id_request
        @id_user = id_user
    end
end