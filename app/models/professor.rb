class Professor < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_and_belongs_to_many :subjects

  validates :first_name, presence: true;
  validates :last_name, presence: true;
  validates :title, presence: true;
end
