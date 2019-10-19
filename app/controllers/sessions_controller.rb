class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    # return head(:forbidden) unless @user.authenticate(params[:password])
    return redirect_to controller: 'users', action: 'new' unless user
    session[:user_id] = user.id

    @user = user
    # redirect_to '/login'
    redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :name
    redirect_to '/'
    # redirect_to controller: 'welcome', action: 'home'
  end
end
