class LikesController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:create,:destroy]
  
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)       
    # @like.current_user = current_user  

    if @like.save
      render partial: 'posts/post_action', locals: {post: @post}, layout: false
    else
      redirect_to :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user_id: @current_user.id)
    @like.destroy
    render partial: 'posts/post_action',locals: {post: @post}, layout: false
  end
end


