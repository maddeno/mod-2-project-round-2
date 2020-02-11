class PassengersController < ApplicationController

    private
    def set_passenger
        @passenger = Passenger.find(params[:id])
    end
    
end
