When(/^захожу на страницу добавления пользователя в админ панели$/) do
  visit('/admin/users/new')
end

When(/^ввожу данные$/) do |table|
  within('#new_user') do
    fill_in('Имя', with: table.hashes[0][:name])
    fill_in('Фамилия', with: table.hashes[0][:surname])
    fill_in('Телефон', with: table.hashes[0][:phone])
    fill_in('Пароль', with: table.hashes[0][:password])
    fill_in('Подтверждение пароля', with: table.hashes[0][:password_confirmation])
  end
end

When(/^нажму кнопку  Создать Пользователя$/) do
  click_button 'Создать Пользователь'
end

When(/^я увижу созданного водителя "([^"]*)" на странице всех водителей$/) do |name|
  assert page.has_content?(name)
end

When(/^захожу на страницу пользователей в админ панели$/) do
  visit('/admin/users')
end

When(/^нажимаю кнопку Edit напротив водителя "([^"]*)"$/) do |phone|
  find(:xpath, "//*[contains(text(), '#{phone}')]/../..//a[contains(@class,'btn btn-xs btn-default')]").click
end

When(/^введу новые данные$/) do |table|
  within('.edit_user') do
    fill_in('Имя',     with: table.hashes[0][:name])
    fill_in('Фамилия', with: table.hashes[0][:surname])
    fill_in('Телефон', with: table.hashes[0][:phone])
  end
end

When(/^я нажму кнопку Сохранить Пользователя$/) do
  click_button 'Сохранить Пользователь'
end

When(/^я увижу измененого водителя "([^"]*)" на странице всех водителей$/) do |name|
  assert page.has_content?(name)
end

When(/^нажимаю кнопку Удалить напротив водителя "([^"]*)"$/) do |phone|
  find(:xpath, "//*[contains(text(), '#{phone}')]/../..//a[contains(@class,'btn btn-xs btn-danger')]").click
  accept_confirm
end

When(/^я не увижу пользователя "([^"]*)" на странице всех водителей$/) do |phone|
  assert(page.has_no_content?(phone))
end

When(/^я захожу на главную страницу$/) do
  visit('/')
end

When(/^нажимаю кнопку Sign up$/) do
  find(:xpath, '//*[@id="navbar-collapse"]/ul[2]/a[1]').click
end

When(/^на странице регистрации ввожу данные$/) do |table|
  @email = table.hashes[0][:phone]
  within("#new_user") do
    fill_in('Phone',                      with: table.hashes[0][:phone])
    fill_in('Password',                   with: table.hashes[0][:password])
    fill_in('user_password_confirmation', with: table.hashes[0][:password_confirmation])
  end
end

When(/^я нажму кнопку Sign up$/) do
  click_button 'Sign up'
end

When(/^увижу свой телефон "([^"]*)" в навбаре$/) do |phone|
  assert page.has_content?(phone)
end