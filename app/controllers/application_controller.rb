class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  before_action :set_current_user
  before_action :auhenticate_user
  add_flash_types :danger, :info, :warning, :success, :messages
  # private

  def set_current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user
    @current_user
  end

  def auhenticate_user
    unless @current_user
      redirect_to new_user_path
    end
  end
end
