class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] =@user.id
			redirect_to welcome_path
		else
			redirect_to signup_path
		end
	end

	def new
		@user = User.new
	end

	def welcome
		if current_user
			@user = current_user
		else
			redirect_to login_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end

end
