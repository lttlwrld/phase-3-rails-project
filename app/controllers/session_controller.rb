class SessionController < ApplicationController
    
    def new
        @user = User.new
    end 

    def create
        user = User.find_by(username: user_params[:username])
        if user != nil
            if user.authenticate(user_params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user.username)
            else
                redirect_to login_path
            end
        else
            redirect_to login_path
        end
    end

    def omniauth
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.username = auth['info']['nickname']
            u.password = "password"
        end
        session[:user_id] = @user.id
        redirect_to user_path(@user.username)
    end

    def destroy
        session.delete("user_id")
        redirect_to root_path
    end

    private

    def auth
      request.env['omniauth.auth']
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
end