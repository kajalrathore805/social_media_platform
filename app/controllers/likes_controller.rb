class LikesController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:create]
  def index
    # @post = Post.find(params[:post_id])
    # @like = @post.likes.find(params[:id])
    @likes = Like.all
  end
	 def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user: @current_user)
    redirect_back_or_to  posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
    @like.destroy
    redirect_back_or_to  posts_path, status: :see_other
  end
end


