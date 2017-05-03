When(/^он перейдёт на страницу создания заказа$/) do
  visit('/orders/new')
end

When(/^заполнит форму данными$/) do |table|
  # table is a table.hashes.keys # => [:from, :to, :what, :cost, :desc]
  fill_in('Откуда', with: table.hashes[0][:from])
  fill_in('Куда', with: table.hashes[0][:to])
  fill_in('Груз', with: table.hashes[0][:what])
  fill_in('Стоимость', with: table.hashes[0][:cost])
  fill_in('Описание', with: table.hashes[0][:desc])
end

When(/^нажмёт на кнопку создать заказ$/) do
  click_on('create_order')
end

When(/^его перенаправит на страницу своих заказов и он увидит там свой заказ$/) do |table|
  # table is a table.hashes.keys # => [:from, :to, :what, :cost, :desc]
  assert page.has_content?(table.hashes[0][:from])
  assert page.has_content?(table.hashes[0][:to])
  assert page.has_content?(table.hashes[0][:what])
  assert page.has_content?(table.hashes[0][:cost])
  assert page.has_content?(table.hashes[0][:desc])
end

When(/^у клиента есть заказ в статусе open$/) do
  create(:order, user: @user)
end

When(/^он увидит кнопку удалить заказ$/) do
  assert page.has_content?('Удалить заказ')
end

When(/^я нажму кнопку удалить заказ$/) do
  click_on('close_order')
end

When(/^статус заказа перейдёт в closed$/) do
  assert page.has_content?('closed')
end

When(/^он перейдёт на страницу просмотра этого заказа$/) do
  visit('/orders/')
  click_on('Информация')
end