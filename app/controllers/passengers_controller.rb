class PassengersController < ApplicationController

    def new
        @errors = flash[:errors]
        @passenger = Passenger.new 
    end

    def create
        @passenger = Passenger.new(passenger_params)
        if @passenger.valid?
            @passenger.save
            session[:passenger_id] = @passenger.id
            redirect_to passenger_path(@passenger)
        else
            redirect_to new_passenger_path
            flash[:errors] = @passenger.errors.full_messages
        end
    end

    def show
        set_passenger
    end

    def edit
        set_passenger
        @errors = flash[:errors]
    end
    
    def update
        set_passenger
        @passenger.assign_attributes(passenger_params)
        if @passenger.valid?
            @passenger.save
            redirect_to passenger_path
        else
            redirect_to edit_passenger_path
            flash[:errors] = @passenger.errors.full_messages 
        end        
    end

    def destroy
        set_passenger
        @passenger.destroy
        redirect_to login_path
    end


    private

    def passenger_params
        params.require(:passenger).permit(:first_name, :last_name, :email, :password)
    end

    def set_passenger
        @passenger = Passenger.find(params[:id])
    end
    
end
