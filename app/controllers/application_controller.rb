class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :logged_in?
    helper_method :time_from_form

    def logged_in?
      !!current_user
    end
  
    def current_user
      User.find_by(id: session[:user_id])
    end

    def time_from_form(time)
      time = time.split(":").collect {|number| number.to_i}
      new_time = (time[0] + (time[1]/60.to_f) + (time[2]/3600.to_f))
    end

end
