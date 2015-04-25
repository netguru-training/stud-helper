class Subject < ActiveRecord::Base
	has_many_and_belongs_to professors
	has_many subject_items
	has_many comments	

	validates :name, presence: true,
		uniqueness: true

	validates :short_name, presence: true,
		uniqueness: true

	validates :description, presence: true
end
