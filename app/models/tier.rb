class Tier < ApplicationRecord
    has_many :reservations 

    def tier_counter
        count = 0
        Reservation.all.each do |t|
            if t.tier_id == self.id
            count +=1
            end
        end
        count
    end
    
end
