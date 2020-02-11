class Reservation < ApplicationRecord
    belongs_to :passenger
    belongs_to :route
    belongs_to :tier 

end
