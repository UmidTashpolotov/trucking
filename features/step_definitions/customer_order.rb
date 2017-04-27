When(/^я захожу на сайт как клиент с email "([^"]*)" password "([^"]*)"$/) do |email, password|
  visit('/')
  click_on('log_in')
  fill_in('Email', with: email)
  fill_in('Пароль', with: password)
  click_on('log_in_button')
end

When(/^я перейду на страницу создания заказа$/) do
  visit('/orders/new')
end

When(/^заполню форму данными$/) do |table|
  # table is a table.hashes.keys # => [:from, :to, :what, :cost, :desc]
  fill_in('Откуда', with: table.hashes[0][:from])
  fill_in('Куда', with: table.hashes[0][:to])
  fill_in('Груз', with: table.hashes[0][:what])
  fill_in('Стоимость', with: table.hashes[0][:cost])
  fill_in('Описание', with: table.hashes[0][:desc])
end

When(/^нажму на кнопку создать заказ$/) do
  click_on('create_order')
end

When(/^меня перенаправит на страницу моих заказов и я увижу там мой заказ$/) do |table|
  # table is a table.hashes.keys # => [:from, :to, :what, :cost, :desc]
  assert page.has_content?(table.hashes[0][:from])
  assert page.has_content?(table.hashes[0][:to])
  assert page.has_content?(table.hashes[0][:what])
  assert page.has_content?(table.hashes[0][:cost])
  assert page.has_content?(table.hashes[0][:desc])
end

When(/^я нахожусь на странице просмотра заказа как клиент email "([^"]*)" password "([^"]*)"$/) do |email, password|
  visit('/')
  click_on('log_in')
  fill_in('Email', with: email)
  fill_in('Пароль', with: password)
  click_on('log_in_button')
  visit('/orders/')
  click_on('Информация')
end

When(/^у заказа статус open$/) do
  assert page.has_content?('open')
end

When(/^я увижу кнопку удалить заказ$/) do
  assert page.has_content?('Удалить заказ')
end

When(/^я нажму кнопку удалить заказ$/) do
  click_on('close_order')
end

When(/^статус заказа перейдёт в closed$/) do
  assert page.has_content?('closed')
end