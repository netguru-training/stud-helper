class User < ActiveRecord::Base
  has_many :subject_items
  has_many :comments

  mount_uploader :picture, PictureUploader

  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  acts_as_voter

  def self.from_omniauth(auth)
    hash = Users::OauthHash.new(auth)

    first_or_create do |user|
      user.email = hash.email
      user.password = Devise.friendly_token[0,20]
      user.name = hash.full_name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
