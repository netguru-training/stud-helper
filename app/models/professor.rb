class Professor < ActiveRecord::Base
  has_many :comments, as: :commentable

  validates :first_name, presence: true;
  validates :last_name, presence: true;
  validates :title, presence: true;
end
