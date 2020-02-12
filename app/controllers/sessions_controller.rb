class SessionsController < ApplicationController

  include SessionsHelper

  def new
    @errors = flash[:message]
  end
  
  def create
    passenger = Passenger.find_by(email: (params[:email]))
    if passenger && passenger.authenticate(params[:password])
      session[:passenger_id] = passenger.id
      redirect_to passenger_path(passenger)
    else
      redirect_to login_path
      flash[:message] = "Invalid Credentials"
    end
  end
  
  def destroy
    session[:user_id] = nil
    # session.delete(:user_id)
    redirect_to login_path
  end
end