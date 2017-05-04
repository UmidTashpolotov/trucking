FactoryGirl.define do

  factory :comment do
    body {Faker::Lorem.sentence}
    rating {rand(1..5)}
  end

end