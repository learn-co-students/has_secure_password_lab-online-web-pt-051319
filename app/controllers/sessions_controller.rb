class SessionsController < ApplicationController

  def create 
    user = User.find_by(name: session_params[:name])
    return head(:forbidden) unless user.authenticate(session_params[:password])
    session[:user_id] = user.id 
  end 

  def destroy 
    session.delete(:user_id)
  end 

  private 

  def session_params 
    params.require(:user).permit(:name, :password)
  end 

end 