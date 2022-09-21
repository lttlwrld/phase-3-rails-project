class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :logged_in?

    ##validates_presence_of :username, :name, :email, :password
    ##validates :username, uniqueness: true
    ##validates :email, uniqueness: true
  
    def logged_in?
      !!current_user
    end
  
    def current_user
      User.find_by(id: session[:user_id])
    end

end
