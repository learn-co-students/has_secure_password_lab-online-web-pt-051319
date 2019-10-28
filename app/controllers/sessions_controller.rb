class SessionsController < ApplicationController 

    def new 
        params.permit!
    end 


    def create 
        params.permit!
        if params[:user][:name].nil? || params[:user][:name] == ''
            redirect_to '/login'
        else 
            @user = User.find_by(name: params[:user][:name])
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        end 
    end 

    def destroy 
        session.delete :name 
    end 

end 


