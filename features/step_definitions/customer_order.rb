When(/^я захожу на сайт как клиент с email "([^"]*)" password "([^"]*)"$/) do |arg1, arg2|
  visit('/')
  click_on('log_in')
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
  sleep 10
end

When(/^нажму на кнопку создать заказ$/) do
  pending
end

When(/^меня перенаправит на страницу всех заказов$/) do
  pending
end

When(/^я увижу там мой заказ$/) do |table|
  # table is a table.hashes.keys # => [:from, :to, :what, :cost, :desc]
  pending
end