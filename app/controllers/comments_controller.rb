class CommentsController < ApplicationController
  before_action :set_post, only: [:index, :create, :edit, :update, :destroy]
  def index
    @comments = @post.comments.includes(:post)
  end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to post_comments_path(@post)
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to post_comments_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_comments_path(@post), status: :see_other
  end

  def set_post
      @post = Post.find(params[:post_id])
    end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :body)
    end    
end
