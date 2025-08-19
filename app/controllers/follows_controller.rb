class FollowsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

 def create
  @user = User.find(params[:following_id])
  follow = Follow.new(user_id: current_user.id, following_id: @user.id)

  if follow.save
    render partial: "users/follow_button", locals: { user: @user }
  else
    head :unprocessable_entity
  end
end

def destroy
  @user = User.find(params[:following_id])
  follow = Follow.find_by(user_id: current_user.id, following_id: @user.id)

  if follow
    follow.destroy
    render partial: "users/follow_button", locals: { user: @user }
  else
    head :not_found
  end
end

end
