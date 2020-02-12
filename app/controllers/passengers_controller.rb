class PassengersController < ApplicationController

    def new
        @errors = flash[:errors]
        @passenger = Passenger.new 
    end

    def create
        # byebug
        @passenger = Passenger.new(passenger_params)
        if @passenger.valid?
            @passenger.save
            redirect_to passenger_path(@passenger)
        else
            redirect_to new_passenger_path
            flash[:errors] = @passenger.errors.full_messages
        end
    end


    private

    def passenger_params
        params.require(:passenger).permit(:first_name, :last_name, :email, :password)
    end

    def set_passenger
        @passenger = Passenger.find(params[:id])
    end
    
end
