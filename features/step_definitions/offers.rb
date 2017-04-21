When(/^он зайдет на страницу заказа$/) do
  visit('/')
end

When(/^создаст предложение$/) do
  find(:xpath, '/html/body/div/div/div/article[1]/div/div[2]/section/a').click
end

When(/^ему надо заполнить форму предложения следующими данными$/) do |table|
  within('#new_offer') do
    fill_in('Описание', with: table.hashes[0][:about])
    click_button 'Предложить'
  end
end

When(/^он увидит созданное предложение "([^"]*)" на странице соответствующего заказа$/) do |offer|
  assert page.has_content?(offer)
end

When(/^форма для добавления предложения изчезнет$/) do
  assert !page.has_css?('#new_offer')
end

When(/^он зайдет на страницу заказа, на который он создал предложение$/) do
  visit('/')
  find(:xpath, '/html/body/div/div/div/article[1]/div/div[2]/section/a').click
end

When(/^он увидит форму для редактирования своего предложения$/) do
  assert page.has_css?('#offer_about')
end

When(/^нажмет на ссылку "([^"]*)"$/) do |arg|
  click_link(arg)
end

When(/^он введет новые данные$/) do |table|
  fill_in(:offer_about, with: table.hashes[0][:about])
  click_button 'Предложить'
end

When(/^отредактированное предложение "([^"]*)" появится под заказом$/) do |editedoffer|
  assert page.has_content?(editedoffer)
end

When(/^форма для заполнения исчезнет$/) do
  assert !page.has_css?('#offer_about')
end

When(/^кликнет ссылку "([^"]*)"$/) do |arg|
  click_link(arg)
end

When(/^на странице появится форма для заполнения предложения$/) do
  assert page.has_css?('#new_offer')
end

When(/^его предложение "([^"]*)" будет удалено$/) do |offer|
  assert !page.has_content?(offer)
end