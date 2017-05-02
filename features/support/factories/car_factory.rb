FactoryGirl.define do

  factory :car do
    name {Faker::Name.first_name}
    surname {Faker::Name.last_name}
    phone {'0555 555s 555'}
    email {Faker::Internet.email}
    password {'qweqwe'}
    password_confirmation {'qweqwe'}
    active {true}

  end

end