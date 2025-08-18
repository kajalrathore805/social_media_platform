class FollowsController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:create,:destroy]


  def create
    @user = User.find(params[:user_id]) 
    @follow = Follow.new(user_id: current_user.id,following_id: @user.id)

    if @follow.save
      render partial: 'users/follow_button', layout: false
    else
      redirect_back fallback_location: homes_path
    end
  end

   def destroy
    @user = User.find(params[:user_id])
    @follow = Follow.find_by(user_id: current_user.id, following_id: @user.id)

    if @follow
      @follow.destroy
      render partial: 'users/follow_button', layout: false
    else
      redirect_back fallback_location: homes_path
    end
  end
end