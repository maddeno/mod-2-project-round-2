class ReservationsController < ApplicationController

    def new
        @errors = flash[:errors]
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.valid?
            @reservation.save
            redirect_to passenger_path(@reservation.passenger)
        else
            redirect_to new_reservation_path
            flash[:errors] = @reservation.errors.full_messages
        end
    end

    def edit
    end

    def update
    end

    private

    def find_reservation
        @reservation = Reservation.find(params[:id])
    end

    def reservation_params

    end


end
