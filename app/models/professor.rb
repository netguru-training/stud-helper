class Professor < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_and_belongs_to_many :subjects
  has_many :comments, as: :owner
  accepts_nested_attributes_for :comments

  validates :first_name, presence: true;
  validates :last_name, presence: true;
  validates :title, presence: true;

  def vote_average
    "%.2f" % (get_likes.size.to_f / ( get_likes.size + get_dislikes.size ))
  end

  acts_as_votable
end