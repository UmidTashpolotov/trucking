FactoryGirl.define do

  factory :order do
    about {"Какой то заказ"}
    from_city {Faker::Address.city}
    to_city {Faker::Address.city}
    cargo {Faker::Food.ingredient}
    price {Faker::Commerce.price}
    weight {Faker::Number.number(3)}
    volume {Faker::Food.measurement}
    transport {Car::CAR_TYPE_SAMPLE.sample}
    departure_date {Faker::Time.forward(23, :morning)}
    payment_method {'наличными при разгрузке'}
    temperature_regime {'от 10 до 25 градусов'}
    loading_type {Car::LOAD_TYPE_SAMPLE.sample}
    status {'open'}
  end

end
