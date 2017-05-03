When(/^удаляет автомобиль$/) do
  click_on('delete_car')
end

When(/^у перевозчика есть машина$/) do
  create(:car, user: @user)
end

When(/^переходит на страницу редактирования автомобиля$/) do
  visit('my_profile')
  click_on('edit_car')
end

When(/^меняет название на "([^"]*)" грузоподъёмность "([^"]*)" объём "([^"]*)" загрузка "([^"]*)" тип "([^"]*)"$/) do |desc, weight, volume, load_type, car_type|
  fill_in('car_about', with: desc)
  select(weight)
  select(volume)
  select(load_type)
  select(car_type)
  click_on('create_car')
end

When(/^данные машины изменятся на "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/) do |desc, weight, volume, load_type, car_type|
  page.has_content?(desc)
  page.has_content?(weight)
  page.has_content?(volume)
  page.has_content?(load_type)
  page.has_content?(car_type)
end

When(/^создаст машину$/) do
  @car = build(:car)
  click_on('add_car')
  fill_in('car_about', with: @car.about)
  select(@car.weight)
  select(@car.volume)
  select(@car.load_type)
  select(@car.car_type)
  click_on('create_car')
end

When(/^он увидит эту машину в своём профиле$/) do
  page.has_content?(@car.about)
  page.has_content?(@car.weight)
  page.has_content?(@car.volume)
  page.has_content?(@car.load_type)
  page.has_content?(@car.car_type)
end