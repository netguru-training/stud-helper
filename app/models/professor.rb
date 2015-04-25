class Professor < ActiveRecord::Base
<<<<<<< HEAD
  has_many :comments, as: :commentable
  has_and_belongs_to_many :subjects
=======
  has_many :comments, as: :owner
>>>>>>> e9d77abfc835e132f3f716d6fd8f9eeac40c27ed

  validates :first_name, presence: true;
  validates :last_name, presence: true;
  validates :title, presence: true;
end
