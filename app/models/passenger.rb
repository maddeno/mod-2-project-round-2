class Passenger < ApplicationRecord
    has_many :reservations 
    has_many :routes, through: :reservations 

    validates_presence_of :email
    validates_uniqueness_of :email
    validates_presence_of :password_digest
    
end
