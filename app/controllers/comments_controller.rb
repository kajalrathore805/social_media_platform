class CommentsController < ApplicationController

  
	def index
    @post = Post.find(params[:post_id])
  end

	 def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to  post_comments_path(@post)
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
