class Passenger < ApplicationRecord
    has_secure_password
    has_many :reservations 
    has_many :routes, through: :reservations 

    validates_presence_of :email
    validates_uniqueness_of :email
    # validates_presence_of :password_digest {message: "Password required"}
    
end
