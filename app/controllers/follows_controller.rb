class FollowsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def create
  @user = User.find(params[:following_id])
  follow = Follow.create(user_id: current_user.id, following_id: @user.id)


   # follow.user_id = current_user.id

    # if follow.save
    #   Notification.create(
    #     recepient: @user,
    #     actor: current_user,
    #     action: 'Followed you',
    #     notifiable: follow
    #   ) unless @user == current_user

       render partial: "users/follow_button", locals: { user: @user }
    # else
    #   redirect_to :new
    # end
  end

  def destroy
    @user = User.find(params[:following_id])
    follow = Follow.find_by(user_id: current_user.id, following_id: @user.id)
      follow.destroy
      render partial: "users/follow_button", locals: { user: @user }
  end

  def user_follow_users
    @user = User.find(params[:following_id])
    @followers = @user.followers.eager_load(:follower).order('name')
  end

  def user_following_users
    @user = User.find(params[:user_id])
    @followings = @user.followings.eager_load(:following).order('name')
  end
end
