class SubjectItem < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  validates :description, presence: true
end
