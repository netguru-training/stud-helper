FactoryGirl.define do
  factory :professor do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    title { FFaker::Education.degree }
  end
end
