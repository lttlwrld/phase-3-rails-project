class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :logged_in?

    def logged_in?
      !!current_user
    end
  
    def current_user
      User.find_by(id: session[:user_id])
    end

end
