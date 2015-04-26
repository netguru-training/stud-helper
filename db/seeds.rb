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
    created_at: Random.rand(40).days.ago)
end

(1..40).each do
  name = Faker::Lorem.sentence
  short_name = "#{Faker::Lorem.word}#{Random.rand(1000)}"
  description = Faker::Lorem.paragraph
  subject = Subject.create!(name: name, short_name: short_name, description: description, created_at: Random.rand(40).days.ago)
  (1..20).each do
    desc = Faker::Lorem.sentence
    subject_item = SubjectItem.new(description: desc, subject_id: subject.id, created_at: Random.rand(40).days.ago)
    subject_item.item = (File.open(File.join(Rails.root, "public/robots.txt"))) 
    subject_item.save!
    subject.subject_items << subject_item
  end
end

PROF_TITLES = %w(professor doctor master engineer)
users_count = User.count
subjects_count = Subject.count
for i in (1..40) do
  prof = Professor.create!(first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    title: PROF_TITLES.sample.capitalize,
    created_at: Random.rand(40).days.ago)
  for user_id in (1..users_count) do
    case rand(3)
    when 1
      prof.liked_by User.find_by(id: user_id)
    when 2
      prof.disliked_by User.find_by(id: user_id)
    end
  end
  for comment_number in (0..rand(10))
    Comment.create!(content: Faker::Lorem.sentence, 
      owner: prof, 
      created_at: (24*60*comment_number + Random.rand(24)*60 + Random.rand(60)).minutes.ago,
      user_id: rand(users_count) + 1)
  end
  for subject_number in (0..rand(5))
    prof.subjects << Subject.find_by(id: rand(subjects_count) + 1)
    prof.save!
  end
end