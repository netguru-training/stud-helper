# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: "admin@example.com", 
  name: "admin", 
  password: "admin123",
  password_confirmation: "admin123",
  role: "admin")




(0..20).each do
	name = Faker::Lorem.sentence
	short_name = Faker::Lorem.word
	description = Faker::Lorem.paragraph
	Subject.create!(name: name, short_name: short_name, description: description)
end