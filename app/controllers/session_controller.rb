class SessionController < ApplicationController
	skip_before_action :auhenticate_user, only: [:create, :new]

	def new

	end
	
	def create
		@user = User.find_by(email: params[:email])

		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def destroy
    session.delete :user_id
    # flash[:alert] = "You have been signed out!"
    redirect_to new_session_path, success: "You have been signed out!"
  end
end
