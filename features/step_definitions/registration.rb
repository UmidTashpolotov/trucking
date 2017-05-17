When(/^я нажму на кнопку зарегистрироваться$/) do
  visit('/')
  click_on('sign_up')
end

When(/^я введу данные$/) do |table|

  # table is a table.hashes.keys # => [:email, :password, :password_confirmation, :role]
  fill_in('Email', with: table.hashes[0][:email])
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
  # table is a table.hashes.keys # => [:email, :role]
  page.has_content?(table.hashes[0][:email])
  page.has_content?(table.hashes[0][:role])
end