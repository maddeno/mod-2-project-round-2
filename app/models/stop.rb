class Stop < ApplicationRecord
    belongs_to :route 

    def departure_counter
        count = 0
        Reservation.all.each do |res|
            if res.departure_city == self.city_name
            count +=1
            end
        end
        count
    end
    def destination_counter
        count = 0
        Reservation.all.each do |res|
            if res.destination_city == self.city_name
            count +=1
            end
        end
        count
    end
    
end
