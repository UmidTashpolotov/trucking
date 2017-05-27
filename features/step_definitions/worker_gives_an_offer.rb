When(/^он переходит на страницу открытого к предложениям заказа$/) do
  click_on('Информация')
end

When(/^он видит форму оставления предложения$/) do
  page.has_content?('Предложите свою цену:')
end

When(/^он оставит своё предложение с ценой "([^"]*)"$/) do |price|
  fill_in('offer_about', with: price)
  click_on('create_offer')
end

When(/^предложение с ценой "([^"]*)" будет видно под заказом$/) do |price|
  page.has_content?(price)
end

When(/^у перевозчика есть предложение с ценой "([^"]*)"$/) do |price|
  @offer = create(:offer, order: @order, user: @user, about: price)
end

When(/^он поменяет своё предложение на "([^"]*)"$/) do |price|
  visit('/')
  click_on('Информация')
  click_on('change_offer_price')
  fill_in('offer_about', with: price)
  click_on('create_offer')
end

When(/^он удалит своё предложение$/) do
  visit('/')
  click_on('Информация')
  click_on('delete_offer')
end


When(/^у перевозчика есть предложение$/) do
  @offer = create(:offer, order: @order, user: @user, about: rand(10_000..99_000))
end