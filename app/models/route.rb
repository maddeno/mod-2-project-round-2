class Route < ApplicationRecord
    has_many :reservations 
    has_many :passengers, through: :reservations 
    has_many :stops 
end
