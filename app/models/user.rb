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


end
