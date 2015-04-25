class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

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

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :picture
  end

end
