class SessionController < ApplicationController
 skip_before_action :auhenticate_user, only: [:create, :new]

  def new
    @user = User.new 
  end

  def create
    input = params[:user][:combined_value]
    password = params[:user][:password]

    
    @user = User.find_by(email: input) || User.find_by(phone: input)

    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid email/phone or password"
      @user = User.new 
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, success: "You have been signed out!"
  end
end
