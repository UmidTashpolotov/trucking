When(/^залогинен пользователь с email: "([^"]*)" и паролем "([^"]*)"$/) do |email, pass|
  visit 'users/sign_in'
  within('#new_user') do
    fill_in('user_email', with: email)
    fill_in('user_password', with: pass)
    click_button 'Log in'
  end
end

When(/^зайдет на страницу добавления заказа$/) do
  visit ('/orders/new')
end

When(/^заполнит форму заказа данными$/) do |table|
  @about = table.hashes[0][:about]
  within('#new_order') do
    fill_in('Откуда', with: table.hashes[0][:from])
    fill_in('Куда', with: table.hashes[0][:where])
    fill_in('Груз', with: table.hashes[0][:cargo])
    fill_in('Стоимость', with: table.hashes[0][:price])
    fill_in('Описание', with: table.hashes[0][:about])
    fill_in('Вес', with: table.hashes[0][:weight])
    fill_in('Объем', with: table.hashes[0][:volume])
    fill_in('Тип транспорта', with: table.hashes[0][:transport])
    fill_in('Метод оплаты', with: table.hashes[0][:payment])
    fill_in('Температурный режим', with: table.hashes[0][:temp])
    fill_in('Метод погрузки', with: table.hashes[0][:load])
    click_button 'Создать заказ'
  end
end

When(/^я увижу созданный заказ на странице моих заказов$/) do
  assert page.has_content?(@about)
end

When(/^зайдет на страницу своих заказов$/) do
  visit('/')
end

When(/^выберет на ней последний заказ$/) do
  find(:xpath, "//*[contains(text(),'#{@about}')]/../..//a[contains(text(), 'Информация')]").click
end

When(/^нажмет на кнопку "([^"]*)"$/) do |del|
  find(:xpath, "//*[contains(text(),'#{del}')]").click
end

When(/^заказа не будет видно на странице$/) do
  assert !page.has_content?(@about)
end