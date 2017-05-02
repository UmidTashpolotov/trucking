FactoryGirl.define do

  factory :car do
    about {Faker::Company.name}
    weight {Car::WEIGHT_SAMPLE.sample}
    volume {Car::VOLUME_SAMPLE.sample}
    load_type {Car::LOAD_TYPE_SAMPLE.sample}
    car_type {Car::CAR_TYPE_SAMPLE.sample}
  end

end