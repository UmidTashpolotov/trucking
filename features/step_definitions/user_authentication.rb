When(/^я перейду в админ панель$/) do
  visit('/admin')
end

When(/^меня перенаправит на главную страницу и выдаст сообщение "([^"]*)"$/) do |message|
  assert page.has_content?(message)
end
	