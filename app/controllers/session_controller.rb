class SessionController < ApplicationController
    
    def new
    end 

    def create
        user = User.find_by(username: params[:username])
        if user != nil
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user.username)
            else
                redirect_to login_path
            end
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete("user_id")
        redirect_to root_path
    end

end