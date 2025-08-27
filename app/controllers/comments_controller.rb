class CommentsController < ApplicationController

  
	def index
    @post = Post.find(params[:post_id])
  end

	 def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    # @comment.commenter = current_user.id

    # if @comment.save
    #   Notification.create(
    #     recepient: @post.user,
    #     actor: current_user,
    #     action: 'commented on your post',
    #     notifiable: @comment
    #   ) unless @post.user == current_user

      redirect_to post_comments_path(@post)
    # else
    #   render :new
    # end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_comments_path(@post), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
