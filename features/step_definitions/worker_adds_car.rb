When(/^я захожу на сайт как водитель с email "([^"]*)" password "([^"]*)"$/) do |email, password|
  visit('/')
  click_on('log_in')
  fill_in('Email', with: email)
  fill_in('Пароль', with: password)
  click_on('log_in_button')
end

When(/^создаст машину с данными$/) do |table|
  click_on('add_car')
  fill_in('car_about', with: table.hashes[0][:desc])
  select(table.hashes[0][:weight])
  select(table.hashes[0][:volume])
  select(table.hashes[0][:load_type])
  select(table.hashes[0][:car_type])
  click_on('create_car')
end

When(/^он увидит машину c этими параметрами в своём профиле$/) do |table|
  page.has_content?(table.hashes[0][:desc])
  page.has_content?(table.hashes[0][:weight])
  page.has_content?(table.hashes[0][:volume])
  page.has_content?(table.hashes[0][:load_type])
  page.has_content?(table.hashes[0][:car_type])
end

When(/^решу изменить данные$/) do |table|
  # table is a table.hashes.keys # => [:desc, :weight, :volume, :load_type, :car_type]
  click_on('edit_car')
  fill_in('car_about', with: table.hashes[0][:desc])
  select(table.hashes[0][:weight])
  select(table.hashes[0][:volume])
  select(table.hashes[0][:load_type])
  select(table.hashes[0][:car_type])
  click_on('create_car')
end

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

When(/^данные машины изменятся на "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |desc, weight, volume, load_type, car_type|
  page.has_content?(desc)
  page.has_content?(weight)
  page.has_content?(volume)
  page.has_content?(load_type)
  page.has_content?(car_type)
end