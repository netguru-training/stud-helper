class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protected
  def check_if_admin!
    unless current_user.admin?
      flash[:error] = "You don't have admin permission."
      redirect_to root_path
    end
  end

  def already_voted(resource)
    flash[:danger] = "Sorry, you had already voted this #{resource.class.name}"
  end
end
