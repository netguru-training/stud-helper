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

for i in (1..40) do
  User.create!(email: "user#{i}@example.com", 
    name: "user#{i}", 
    password: "password",
    password_confirmation: "password",
    created_at: Random.rand(40).hours.ago)
end

PROF_TITLES = %w(professor doctor master engineer)
users_count = User.count
for i in (1..40) do
  prof = Professor.create!(first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    title: PROF_TITLES.sample.capitalize)
  for user_id in (1..users_count) do
    case rand(3)
    when 1
      prof.liked_by User.find_by(id: user_id)
    when 2
      prof.disliked_by User.find_by(id: user_id)
    end
  end
end

(0..40).each do
	name = Faker::Lorem.sentence
	short_name = "#{Faker::Lorem.word}#{Random.rand(1000)}"
	description = Faker::Lorem.paragraph
	Subject.create!(name: name, short_name: short_name, description: description, created_at: Random.rand(40).days.ago)
end