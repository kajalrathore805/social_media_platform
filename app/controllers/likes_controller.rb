class LikesController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:create,:destroy]
  
	def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user: @current_user)
    # @notification = CreateLikeNotification.new(@like, @current_user)
    # @notification.call
    # @like.user_id = current_user.id

    # if @like.save
    #   Notification.create(
    #     recepient: @post.user,
    #     actor: current_user,
    #     action: 'liked on your post',
    #     notifiable: @like
    #   ) unless @post.user == current_user

      render partial: 'posts/post_action', locals: {post: @post}, layout: false
    # else
    #   redirect_to :new
      # end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user_id: @current_user.id)
    @like.destroy
    render partial: 'posts/post_action',locals: {post: @post}, layout: false
  end
end


