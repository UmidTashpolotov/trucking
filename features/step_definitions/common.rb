Допустим(/^в приложении есть перевозчик/) do
  @user = create(:worker)
end


Допустим(/^в приложении есть заказчик/) do
  @user = create(:customer)
end

Допустим(/^в приложении есть администратор$/) do
  @user = create(:admin)
end

# Общие степы

Если(/^он заходит в систему$/) do
  visit('/')
  click_on('log_in')
  fill_in('Email', with: @user.email)
  fill_in('Пароль', with: @user.password)
  click_on('log_in_button')
end

When(/^переходит на страницу своего профиля$/) do
  visit('/my_profile')
end

When(/^увидит надпись "([^"]*)"$/) do |message|
  page.has_content?(message)
end