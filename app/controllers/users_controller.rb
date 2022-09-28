class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.username)
        else
            render :new
        end 
    end

    def bio
        @user = User.find_by(username: params[:username])
        if logged_in? && @user == current_user
            render :bio
        else
            redirect_to user_path(@user.username)
        end
    end

    def edit_bio
        if user_params[:password].blank?
            user_params.delete(:password)
        end
        @user = User.find_by(username: params[:username])
        @user.update(user_params)
        redirect_to user_path(@user.username)
    end

    def show
        @user = User.find_by(username: params[:username])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :name, :bio)
    end

end