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
end
