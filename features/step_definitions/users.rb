When(/^захожу на страницу администратора$/) do
  visit('/admin')
end

When(/^нажимаю кнопку Add users$/) do
  find(:xpath, '/html/body/div/div/h1/a').click
end

When(/^на странице создания пользователя ввожу данные$/) do |table|
  within ("#new_user") do
    fill_in('Email',                      with: table.hashes[0][:email])
    fill_in('Name',                       with: table.hashes[0][:name])
    fill_in('Surname',                    with: table.hashes[0][:surname])
    fill_in('Phone',                      with: table.hashes[0][:phone])
    fill_in('Password',                   with: table.hashes[0][:password])
    fill_in('Password confirmation',      with: table.hashes[0][:password_confiramtion])
  end
end

When(/^нажму кнопку  Create User$/) do
  click_button 'Create User'
end

When(/^я увижу созданного водителя "([^"]*)" на странице всех водителей$/) do |name|
  assert page.has_content?(name)
end

When(/^нажимаю кнопку Edit у первого водителя$/) do
  find(:xpath, '//*[@id="user1"]/td[4]/a[1]').click
end

When(/^введу новые данные$/) do |table|
  within ("#edit_user_1") do
    fill_in('Email',                      with: table.hashes[0][:email])
    fill_in('Name',                       with: table.hashes[0][:name])
    fill_in('Surname',                    with: table.hashes[0][:surname])
    fill_in('Phone',                      with: table.hashes[0][:phone])
    fill_in('Password',                   with: table.hashes[0][:password])
    fill_in('Password confirmation',      with: table.hashes[0][:password_confiramtion])
  end
end

When(/^я нужму кнопку Update User$/) do
  click_button 'Update User'
end

When(/^я увижу измененого водителя "([^"]*)" на странице всех водителей$/) do |name|
  assert page.has_content?(name) 
end