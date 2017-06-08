When(/^я не зарегистрирован и зашёл на сайт$/) do
  visit('/')
end

When(/^я заполню форму и нажму кнопку "([^"]*)"$/) do |arg|
  fill_in('Откуда', with: 'Бишкек')
  fill_in('Куда', with: 'Ош')
  fill_in('Вес', with: '20 тонн')
  fill_in('Объём', with: '433 куба')
  fill_in('Телефон', with: '996 553 888 555')

  click_on('create_bid')
end

When(/^выйдет надпись: "([^"]*)"$/) do |message|
  assert page.has_content?(message)
end

When(/^он создаст заявку$/) do
  click_on('new_bid')

  fill_in('Откуда', with: 'Бишкек')
  fill_in('Куда', with: 'Ош')
  fill_in('Вес', with: '20 тонн')
  fill_in('Объём', with: '433 куба')

  click_on('create_bid')
end