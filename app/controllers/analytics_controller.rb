
class AnalyticsController < ApplicationController

    def index
        @reservations = Reservation.all
        @reservation_hash = @reservations.group_by{|reservation| reservation.destination_city}
        @stops = Stop.all.sort_by{|stop| -stop.route.reservations.count}
        @tiers = Tier.all.sort_by{|tier| -tier.reservations.count}
    end 


end