class Professor < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_and_belongs_to_many :subjects
  has_many :comments, as: :owner

  validates :first_name, presence: true;
  validates :last_name, presence: true;
  validates :title, presence: true;

  acts_as_votable
end