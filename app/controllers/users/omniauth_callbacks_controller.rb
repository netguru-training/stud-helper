class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    all
  end

  def all
    return sign_in_with_msg if user.present?

    session[:omniauth_hash] = auth_hash.to_json
    redirect_to new_from_omniauth_users_url
  end

  private

  def auth_hash
    # delete :extra from hash, to save the sessions space
    request.env['omniauth.auth'].delete 'extra'
    request.env['omniauth.auth']
  end

  def sign_in_with_msg
    set_flash_message(:notice, :success, :kind => "social network")
    sign_in_and_redirect user
  end

  def user
    @user ||= Users::UserFromAuth.new(auth_hash).user
  end

end
