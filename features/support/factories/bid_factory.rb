FactoryGirl.define do

  factory :bid_offer, class: Bid do
    from_city { Faker::Company.name }
    to_city { Faker::Company.name }
    weight { Faker::Company.name }
    volume { Faker::Company.name }
    phone { Faker::Company.name }
  end

end