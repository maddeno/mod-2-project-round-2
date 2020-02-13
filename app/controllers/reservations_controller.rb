
class ReservationsController < ApplicationController
    include SessionsHelper

    def new
        @errors = flash[:errors]
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params.merge({passenger_id: session[:passenger_id]}))
        if @reservation.valid?
            @reservation.save
            redirect_to passenger_path(@reservation.passenger)
        else
            redirect_to new_reservation_path
            flash[:errors] = @reservation.errors.full_messages
        end
    end

    def edit
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

    private

    def find_reservation
        @reservation = Reservation.find(params[:id])
    end

    def reservation_params
        params.require(:reservation).permit(:departure_date, :route_id, :departure_city, :destination_city, :tier_id)
    end


end
