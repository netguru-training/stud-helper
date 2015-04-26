module Users
  class OauthHash

    attr_reader :auth

    def initialize(auth)
      @auth = auth
    end

    def facebook?
      provider == 'facebook'
    end

    def twitter?
      provider == 'twitter'
    end

    def credentials
      auth.fetch 'credentials', {}
    end

    def token
      credentials.fetch 'token', nil
    end

    def expires_at
      @expires_at = credentials.fetch 'expires_at', nil
      Time.at(@expires_at) if @expires_at.present?
    end

    def uid
      auth.fetch 'uid', nil
    end

    def provider
      auth.fetch 'provider', nil
    end

    def info
      auth.fetch 'info', {}
    end

    def email
      info.fetch 'email', nil
    end

    def first_name
      info.fetch 'first_name', nil
    end

    def last_name
      info.fetch 'last_name', nil
    end

    def full_name
      "#{first_name} #{last_name}"
    end
  end
end