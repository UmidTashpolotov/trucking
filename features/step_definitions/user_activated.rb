When(/^в системе есть неактивированный перевозчик с номером "([^"]*)"$/) do |phone|
  create(:worker, phone: phone, active: false)
end

When(/^он зайдет на страницу личного профиля$/) do
  visit('/')
  click_on('log_in')
  fill_in('Телефон', with: '996555777888')
  fill_in('Пароль', with: 'qweqwe')
  click_on('log_in_button')
  visit('/my_profile/')
end

When(/^он увидит надпись "([^"]*)"$/) do |inactive|
  assert page.has_content?(inactive)
  click_on('dropdown_accaunt')
  click_on('log_out')
end

When(/^он перейдет на страницу неактивированных пользователей, и нажмет кнопку активации перевозчика с номером "([^"]*)"$/) do |phone|
  visit('/admin/users?sort=inactive_workers/')
  find(:xpath, "//*[@id='user_activated']").click
end

When(/^перевозчик с номером "([^"]*)" будет в списке активированных перевозчиков$/) do |phone|
  visit('/admin/users?sort=workers')
  assert page.has_content?(phone)
  visit('/')
  click_on('dropdown_accaunt')
  click_on('log_out')
end

Допустим(/^в систему вошел перевозчик с номером "([^"]*)" и паролем "([^"]*)"$/) do |phone, password|
  click_on('log_in')
  fill_in('Телефон', with: phone)
  fill_in('Пароль', with: password)
  click_on('log_in_button')

end

Если(/^он перейдет на страницу личного профиля$/) do
  visit('/my_profile/')
end

То(/^он увидит свой статус как "([^"]*)"$/) do |active|
  assert page.has_content?(active)
end

