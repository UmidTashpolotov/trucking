When(/^в системе есть пользователь с неподтвержденным номером "([^"]*)"$/) do |phone|
  @user = create(:customer, phone: phone, phone_checked: false)
end

When(/^перейдет на страницу подтверждения номера телефона$/) do
  visit '/users/sms_verify_form'
end

When(/^введет в поле 'секретный код' код полученый в смс$/) do
  fill_in('Секретный код', with: User.last.sms_code)
  click_on('phone_check_button')
end

When(/^нажмет на кнопку ручного подтверждения номера телефона напротив пользователя "([^"]*)"$/) do |phone|
  find(:xpath, "//*[contains(text(), '#{phone}')]/../..//a[contains(@class,'btn btn-xs btn-success btn-phone-confirm')]").click
end

When(/^номер телефона "([^"]*)" станет проверенным$/) do |phone|
  find(:xpath, "//*[contains(text(), '#{phone}')]/..//span[contains(@class, 'glyphicon glyphicon-phone text-success')]")
end