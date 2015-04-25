FactoryGirl.define do
  factory :comment do
    content { FFaker::Lorem.sentence }
  end
end
