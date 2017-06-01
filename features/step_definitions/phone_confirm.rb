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
