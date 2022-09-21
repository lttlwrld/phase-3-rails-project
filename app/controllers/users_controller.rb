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
            render 'new'
        end 
    end

    def show
        @user = User.find_by(username: params[:username])
    end

    def bio
        @user = User.find_by(username: params[:username])
        if logged_in?
            if @user == current_user
                render "bio"
            else
                redirect_to user_path(@user.username)
            end
        else
            redirect_to user_path(@user.username)
        end
    end

    def edit_bio
        @user = User.find_by(username: params[:username])
        @user.bio = params[:bio]
        @user.update(bio: params[:bio])
        redirect_to user_path(@user.username)
    end


    def user_params
        params.permit(:username, :password, :email, :name, :bio)
    end

end