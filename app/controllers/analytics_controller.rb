
class AnalyticsController < ApplicationController
    # Find / count reservations by date, stops, tiers, prices
    def index
        @reservations = Reservation.all
        @stops = Stop.all
        @tiers = Tier.all
    end 
end