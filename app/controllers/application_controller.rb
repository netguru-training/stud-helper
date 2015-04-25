class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def check_if_admin!
      unless current_user.admin?
        flash[:error] = "You don't have admin permission."
        redirect_to root_path
      end
    end
end
