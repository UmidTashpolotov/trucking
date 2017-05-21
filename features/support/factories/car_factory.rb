FactoryGirl.define do

  factory :car do
    about { Faker::Company.name }
    weight { Car::WEIGHT_SAMPLE.sample }
    volume { Car::VOLUME_SAMPLE.sample }
    load_type { Car::LOAD_TYPE_SAMPLE.sample }
    car_type { Car::CAR_TYPE_SAMPLE.sample }
    imei { '000000000' + rand(100_000..999_999).to_s }
  end

end