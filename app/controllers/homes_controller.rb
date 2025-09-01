class HomesController < ApplicationController

  def index
    @posts = Post.where.not(user_id: current_user.id).order(title: :asc).paginate(page: params[:page], per_page: 5)
    @users = User.where.not(id: current_user.id)
     #  if params[:post_id].present?
     #    @post = Post.find(params[:post_id])
     #    @comments = @post.comments.eager_load(:user)
     # end
  end

end
