FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::Name.name }
    password 'password'
    password_confirmation 'password'

    trait :with_picture do
      picture Rack::Test::UploadedFile.new 'spec/support/files/netguru.jpg', 'image/jpeg'
    end
  end
end
