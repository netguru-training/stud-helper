class Subject < ActiveRecord::Base
	has_and_belongs_to_many :professors
	has_many :subject_items
	has_many :comments, as: :owner

	accepts_nested_attributes_for :subject_items

	validates :name, presence: true,
		uniqueness: true

	validates :short_name, presence: true,
		uniqueness: true

	validates :description, presence: true
end
