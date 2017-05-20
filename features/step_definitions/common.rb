Допустим(/^в приложении есть перевозчик/) do
  @user = @worker = create(:worker)
end

Допустим(/^в приложении есть заказчик/) do
  @user = @customer = create(:customer)
end

Допустим(/^в приложении есть администратор$/) do
  @user = create(:admin)
end

# Общие степы

Если(/^он заходит в систему$/) do
  visit('/')
  click_on('log_in')
  fill_in('Телефон', with: @user.phone)
  fill_in('Пароль', with: @user.password)
  click_on('log_in_button')
end

When(/^переходит на страницу своего профиля$/) do
  visit('/my_profile')
end

When(/^увидит надпись "([^"]*)"$/) do |message|
  page.has_content?(message)
end

When(/^перевозчик с номером "([^"]*)"$/) do |phone|
  create(:worker, phone: phone)
end

When(/^у заказчика есть заказ$/) do
  @order = create(:order, user: @user)
end

When(/^перевозчик с телефоном "([^"]*)"$/) do |arg|
  create(:worker, phone: arg)
end