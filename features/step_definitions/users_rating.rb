When(/^заказчик выбрал предложение перевозчика$/) do
  @offer.accept
  @order.update(worker: @offer.user)
  @order.in_progress
end

When(/^перевозчик выполнил работу$/) do
  @order.complete
end

When(/^увидит форму оставления отзыва$/) do
  assert page.has_content?('Оставьте комментарий')
end

When(/^он оставит отзыв "([^"]*)" оценка "([^"]*)"$/) do |message, rating|
  fill_in('comment_body', with: message)
  select(rating)
  click_on('create_comment')
end

When(/^отзыв "([^"]*)" оценка "([^"]*)" будет виден на странице заказа$/) do |message, rating|
  assert page.has_content?(message)
  assert page.has_content?(rating)
end

When(/^водитель заходит в систему$/) do
  visit('/')
  click_on('log_in')
  fill_in('Телефон', with: @worker.phone)
  fill_in('Пароль', with: @worker.password)
  click_on('log_in_button')
end