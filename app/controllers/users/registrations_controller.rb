class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [ :new, :new_from_omniauth, :create, :create_from_omniauth]
  #layout 'devise/authorization'
  expose(:auth_registration_form) { Users::AuthRegistrationForm.new auth_registration_form_params }
  expose(:auth) { Users::OauthHash.new(omniauth_hash) }

  def update
    if resource.update(user_params)
      sign_in(resource == current_user ? resource : current_user)
      redirect_to resource, notice: 'Your profile was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def create_from_omniauth
    if auth_registration_form.submit!
      set_flash_message :notice, :signed_up if is_flashing_format?
      clear_omniauth_session
      sign_up resource_name, auth_registration_form.user
      redirect_to root_path
    else
      respond_with auth_registration_form, action: :new_from_omniauth
    end
  end

  private

  def user_params
    accessible = [:name, :email, :picture]
    accessible << [:password, :password_confirmation] if params[:user][:password].present?
    params.require(:user).permit(accessible)
  end

  def omniauth_hash
    return {} unless session[:omniauth_hash]
    JSON.parse(session[:omniauth_hash])
  end

  def clear_omniauth_session
    session.delete :omniauth_hash
  end

  def auth_registration_form_params
    params.fetch(:users_auth_registration_form, {}).permit(:email).merge(omniauth_hash: omniauth_hash)
  end

end
