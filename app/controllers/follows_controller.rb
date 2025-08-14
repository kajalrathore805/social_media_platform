class FollowsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@follower = @user.followers.create(follow_params)
    redirect_back_or_to  homes_path
  end

  private
  def follow_params
  	 params.require(:follow).permit(:user_id, :following_id)
  end
end
