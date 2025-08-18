class PostsController < ApplicationController
	before_action :set_post, only: [:show, :like, :unlike]
	def index
		@posts = current_user.posts
	end

	def show
		@post = Post.find(params[:id])
	end

	def like
		current_user.likes.create(post: @post)
    redirect_back fallback_location: posts_path
	end

	def unlike
		like = current_user.likes.find_by(post: @post)
	  like&.destroy
	  redirect_back fallback_location: posts_path
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def edit 
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to post_path
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :user_id, images: [])
	end
end
