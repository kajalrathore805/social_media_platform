class Datatables::UsersController < ApplicationController
  respond_to? :json
  def index
    @users = User.all
    @total_count = @users.count
    @users = @users.offset(params[:start]).limit(params[:length]) unless params[:length] == '-1'
    search = params[:search][:value]
    if search.present?
      @users = @users.where("name LIKE ?", "%#{search}%")
    end
  end
end
