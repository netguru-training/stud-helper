class Professor < ActiveRecord::Base
  validates :first_name, presence: true;
  validates :last_name, presence: true;
  validates :title, presence: true;
end
