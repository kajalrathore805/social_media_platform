class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :destroy

  before_action :set_post, only: [:index, :create, :edit, :update, :destroy]
  def index
    @comments = @post.comments.includes(:user)
  end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
       render partial: 'comment', locals: {comment: @comment}, layout: false
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
    render json: { success: true }, status: 200
  end

  def set_post
      @post = Post.find(params[:post_id])
    end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :body)
    end    
end
