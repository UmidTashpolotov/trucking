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

When(/^в приложении есть менеджер$/) do
  @user = create(:manager)
end

When(/^в приложении есть новая заявка$/) do
  create(:bid_offer)
end

When(/^он перейдёт в раздел заявок$/) do
  visit('/admin/bids')
end

When(/^увидит кнопку 'Закрыть'$/) do
  assert page.has_content?('Закрыть')
end

When(/^он нажмёт кнопку закрыть$/) do
  click_on('Закрыть')
end

When(/^заявка сменит статус на 'old'$/) do
  visit('/admin/bids')
  click_on('Рассмотренные')
  assert page.has_content?('old')
end