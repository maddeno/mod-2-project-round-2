class SessionsController < ApplicationController
  def new
  end
  
  def create
    passenger = Passenger.find_by(email: params[:session][:email])
    if passenger && passenger.authenticate(params[:session][:password])
      session[:passenger_id] = passenger.id
      redirect_to passenger
    else
      flash.now[:message] = 'Invalid email/password combination' # Not quite right
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    # session.delete(:user_id)
    redirect_to login_path
  end
end