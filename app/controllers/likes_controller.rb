class LikesController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:index,:create,:destroy]

  def index
    @likes = Like.includes(:user).where(post_id: 38)
  end
  
	def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user: @current_user)
    render partial: 'posts/post_action', locals: {post: @post}, layout: false
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user_id: @current_user.id)
    @like.destroy
    render partial: 'posts/post_action',locals: {post: @post}, layout: false
  end
end


