class SessionsController < ApplicationController 

  def create
    
    @user = User.find_by(name: params[:user][:name])
    if @user == nil || @user == ""
      redirect_to(controller: 'sessions', action: 'new')
    else
       if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to :root 
       else
        flash[:error] = "Wrong Password"
       end
    end
  end

end