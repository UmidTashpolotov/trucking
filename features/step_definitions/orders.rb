When(/^залогинен пользователь с email: "([^"]*)" и паролем "([^"]*)"$/) do |email, pass|
  visit 'users/sign_in'
  within('#new_user') do
    fill_in('user_email', with: email)
    fill_in('user_password', with: pass)
    click_button 'Log in'
  end
end

When(/^зайдет на страницу добавления заказа$/) do
  visit ('orders/new')
end

When(/^заполнит форму заказа данными$/) do |table|
  @about = table.hashes[0][:about]
  within('#new_order') do
    fill_in('order_about', with: @about)
    click_button 'Создать заказ'
  end
end

When(/^я увижу созданный заказ на странице моих заказов$/) do
  assert page.has_content?(@about)
end