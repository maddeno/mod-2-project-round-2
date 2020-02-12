
module SessionsHelper

    def logged_in?
        # user = User.find_by(id: session[:user_id])
        !!current_passenger
    end
  
    def current_passenger
        if session[:passenger_id]
        @current_passenger ||= Passenger.find_by(id: session[:passenger_id])
        end
    end
  
    def authorize!
        redirect_to login_path unless logged_in?
    end
  
  end