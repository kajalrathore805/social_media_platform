class HomesController < ApplicationController

	def index
	  @posts = Post.where.not(user_id: @current_user.id).order(title: :ASC)
	  @user = User.where.not(user_id: @current_user)
	end
	def show
	  @post = Post.find(params[:post_id])
	   @like = @post.likes.find(params[:id])
	end

end
