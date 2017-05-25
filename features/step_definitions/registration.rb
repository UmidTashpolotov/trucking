When(/^я нажму на кнопку зарегистрироваться$/) do
  visit('/')
  click_on('sign_up')
end

When(/^я введу данные$/) do |table|
  # table is a table.hashes.keys # => [:phone, :password, :password_confirmation, :role]
  fill_in('Телефон', with: table.hashes[0][:phone])
  fill_in('Пароль', with: table.hashes[0][:password])
  fill_in('Подтверждение пароля', with: table.hashes[0][:password_confirmation])
  choose(table.hashes[0][:role])
end

When(/^нажму кнопку Зарегистрироваться$/) do
  click_on('sign_up_button')
end

When(/^я увижу "([^"]*)"$/) do |hello_message|
  page.has_content?(hello_message)
end

When(/^я увижу свои данные$/) do |table|
  # table is a table.hashes.keys # => [:phone, :role]
  page.has_content?(table.hashes[0][:phone])
  page.has_content?(table.hashes[0][:role])
end

When(/^в приложении есть пользователь с номером "([^"]*)"$/) do |phone|
  create(:worker, phone: phone)
end

When(/^я хочу зарегестрироваться как новый пользователь с данными$/) do |table|
  visit('/')
  click_on('sign_up')
  fill_in('Телефон', with: table.hashes[0][:phone])
  fill_in('Пароль', with: table.hashes[0][:password])
  fill_in('Подтверждение пароля', with: table.hashes[0][:password_confirmation])
  choose(table.hashes[0][:role])
  click_on('sign_up_button')
end

When(/^я получу ошибку о том что номер "([^"]*)"$/) do |error|
  assert page.has_content?(error)
end

When(/^я перейду на страницу регистрации$/) do
  visit('/')
  click_on('sign_up')
end

When(/^введу данные$/) do |table|
  fill_in('Телефон', with: table.hashes[0][:phone])
  fill_in('Пароль', with: table.hashes[0][:password])
  fill_in('Подтверждение пароля', with: table.hashes[0][:password_confirmation])
  choose(table.hashes[0][:role])
  click_on('sign_up_button')
end

When(/^я получу ошибку что номер телефона "([^"]*)"$/) do |error|
  assert page.has_content?(error)
end










