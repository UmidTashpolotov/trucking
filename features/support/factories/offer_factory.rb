FactoryGirl.define do

  factory :offer do
    status {'new'}
    about {Faker::Lorem.paragraphs}
  end

end