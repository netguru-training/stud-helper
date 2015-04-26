module Users
  class UserFromAuth

    attr_reader :auth

    def initialize(auth_hash)
      @auth = Users::OauthHash.new(auth_hash)
    end

    def user
      fetch_user
    end

    private

    def fetch_user
      User.find_by(email: auth.email)
    end

  end
end