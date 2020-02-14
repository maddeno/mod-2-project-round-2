
class ReservationsController < ApplicationController
    include SessionsHelper

    def select_departure_city
       @reservation = Reservation.new
    end

    def set_route_id
    #    @route_id = Route.find do |route|
    #         route.stops.city_name.include?(params)
    #     end
    #     @route.id
    puts'====================================================='
        puts params
    end 

    def new
        @errors = flash[:errors]
        @reservation = Reservation.new
        redirect_to select_route_path
    end

    def create
        @reservation = Reservation.new(reservation_params.merge({passenger_id: session[:passenger_id]}))
        if @reservation.valid?
            # @reservation.set_route_id
            @reservation.save
            redirect_to passenger_path(@reservation.passenger)
        else
            redirect_to new_reservation_path
            flash[:errors] = @reservation.errors.full_messages
        end
    end

    def edit
        @errors = flash[:errors]
        find_reservation
    end

    def update
        find_reservation
        @reservation.assign_attributes(reservation_params)
        if @reservation.valid?
            @reservation.save
            redirect_to passenger_path(@reservation.passenger_id)
        else
            redirect_to edit_reservation_path
            flash[:errors] = @reservation.errors.full_messages
        end 
    end

    def show 
        find_reservation
    end 

    def destroy
        find_reservation
        @passenger = @reservation.passenger_id
        @reservation.destroy
        redirect_to passenger_path(@passenger)
    end

    private

    def find_reservation
        @reservation = Reservation.find(params[:id])
    end

    def reservation_params
        params.require(:reservation).permit(:departure_date, :route_id, :departure_city, :destination_city, :tier_id)
    end


end
