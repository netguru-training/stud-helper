class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, polymorphic: true
  accepts_nested_attributes_for :owner

  validates :user, presence: true;
  validates :owner, presence: true;
  validates :content, presence: true;
end
