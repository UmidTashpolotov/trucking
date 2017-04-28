When(/^я захожу на сайт как водитель с email "([^"]*)" password "([^"]*)"$/) do |email, password|
  visit('/')
  click_on('log_in')
  fill_in('Email', with: email)
  fill_in('Пароль', with: password)
  click_on('log_in_button')
end

When(/^создам машину с данными$/) do |table|
  click_on('add_car')
  fill_in('car_about', with: table.hashes[0][:desc])
  select(table.hashes[0][:weight])
  select(table.hashes[0][:volume])
  select(table.hashes[0][:load_type])
  select(table.hashes[0][:car_type])
  click_on('create_car')
end

When(/^я увижу машину c этими параметрами в своём профиле$/) do |table|
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

When(/^удалю автомобиль$/) do
  click_on('delete_car')
end

When(/^увижу надпись "([^"]*)"$/) do |message|
  page.has_content?(message)
end