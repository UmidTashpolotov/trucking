FactoryGirl.define do

  factory :user do
    name {Faker::Name.first_name}
    surname {Faker::Name.last_name}
    phone {'0555'+rand(100000..999999).to_s}
    password {'qweqwe'}
    password_confirmation {'qweqwe'}
    active {true}

    factory :worker do
      role {'worker'}
    end

    factory :customer do
      role {'customer'}
    end

    factory :admin do
      role {'admin'}
    end
  end

end