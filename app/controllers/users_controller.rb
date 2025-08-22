class UsersController < ApplicationController
  
  skip_before_action :auhenticate_user, only: [:create, :new]

  def index
    @users = User.all
  end

  def show
    # @user=User.find_by(id: session[:user_id])
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to new_session_path, success: "Your Account was Created Successfully! you can login now"
    else
      flash[:error] = @user.errors.full_messages
        redirect_to new_user_path
    end
  end 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end
  
  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :phone, :image)
  end
end
