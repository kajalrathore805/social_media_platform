class FollowsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def create
  @user = User.find(params[:following_id])
  follow = Follow.create(user_id: current_user.id, following_id: @user.id)

    render partial: "users/follow_button", locals: { user: @user }, layout: false
  end

  def destroy
    @user = User.find(params[:following_id])
    follow = Follow.find_by(user_id: current_user.id, following_id: @user.id)
      follow.destroy
      render partial: "users/follow_button", locals: { user: @user }, layout: false
  end

end
