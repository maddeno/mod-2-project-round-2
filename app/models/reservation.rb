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

    def self.total_revenue 
        total = 0
        self.all.each do |res|
        total += res.ticket_price
        end
        total
    end

    def reservation_hash
        Reservation.all.map {|reservation| {reservation.destination_city=> Reservation.all.select{|r| r.destination_city == reservation.destination_city}.count }}
    end

    def reservation_count
        reservation_hash.uniq.sort_by {|k,v| v}.reverse
    end


end
