class Reservation < ApplicationRecord
    belongs_to :passenger
    belongs_to :route
    belongs_to :tier 

    validates_presence_of :passenger_id
    validates_presence_of :route_id
    validates_presence_of :departure_date
    validates_presence_of :departure_city
    validates_presence_of :destination_city
    validates_presence_of :tier_id

    def num_of_stops
        departure_stop = Stop.find_by(city_name: self.departure_city)
        destination_stop = Stop.find_by(city_name: self.destination_city)
        if departure_stop.id > destination_stop.id
            departure_stop.id - destination_stop.id
        else destination_stop.id - departure_stop.id
        end
    end

    def ticket_price
        base_price = self.num_of_stops * 30
        base_price += self.tier.price
    end


end
