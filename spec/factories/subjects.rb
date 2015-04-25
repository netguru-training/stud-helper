FactoryGirl.define do
  factory :subject do
    name { FFaker::App.name }
    short_name { FFaker::Lorem.sentence }
    description { FFaker::Lorem.sentence }
  end
end
