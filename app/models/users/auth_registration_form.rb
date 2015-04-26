module Users
  class AuthRegistrationForm
    include Virtus.model
    include ActiveModel::Model

    attribute :email, String
    attribute :omniauth_hash, Hash[String => String]

    validate :email_uniqueness

    def after_initialize
      self.email = auth.email
    end

    def submit!
      return false unless valid?
      return false unless user.save
      true
    end

    def user
      @user ||= User.new(email: fetch_email, name: fetch_user_name, password: Devise.friendly_token[0,20])
    end

    private

    def fetch_user_name
      auth.full_name.presence || 'anonymous user'
    end

    def fetch_email
      email.presence || auth.email
    end

    def auth
      @auth ||= Users::OauthHash.new(omniauth_hash)
    end

    def email_uniqueness
      return if User.where(email: email).empty?
      errors.add :email, 'This email is already taken'
    end

  end
end