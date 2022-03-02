class Admin::UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		
		if current_user.status == 'admin' || current_user.status == 'editor'
			@users = User.all
		else
			redirect_to root_path
			
		end
	end


	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to admin_users_path
	end

	private

	
	def user_params
		params.require(:user).permit(:status)
		
	end
end
