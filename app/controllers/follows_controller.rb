class FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id]) 
    @follow = Follow.new(user_id: current_user.id,following_id: @user.id)

    if @follow.save
      redirect_back fallback_location: homes_path
    else
      redirect_back fallback_location: homes_path
    end
  end

   def destroy
    @user = User.find(params[:user_id])
    @follow = Follow.find_by(user_id: current_user.id, following_id: @user.id)

    if @follow
      @follow.destroy
      redirect_back fallback_location: homes_path
    else
      redirect_back fallback_location: homes_path
    end
  end
end