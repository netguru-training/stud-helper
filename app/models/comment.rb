class Comment < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  accepts_nested_attributes_for :owner
end
