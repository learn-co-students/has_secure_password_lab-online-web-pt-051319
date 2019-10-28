class UsersController < ApplicationController

    def home 

    end 

    def new 

    end 

    def create
        if params[:user][:password] === params[:user][:password_confirmation]
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            redirect_to '/signup' 
        end
    end
     
    private
     
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end 