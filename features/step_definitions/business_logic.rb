When(/^заказ отображается в статусе "([^"]*)"$/) do |status|
  visit('/orders')
  click_on('Информация')
  page.has_content?(status)
end

When(/^клиент создал новый заказ$/) do
  @user = create(:customer)
  step 'он заходит в систему'
  step ''
end