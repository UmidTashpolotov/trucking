When(/^клиент создаст заказ$/) do
  @order = build(:order)
  visit('/orders/new')

  fill_in('Откуда', with: @order.from_city)
  fill_in('Куда', with: @order.to_city)
  fill_in('Груз', with: @order.cargo)
  fill_in('Стоимость', with:  @order.price)
  fill_in('Описание', with:  @order.about)

  click_on('create_order')
end

When(/^его перенаправит на страницу своих заказов и он увидит там свой заказ$/) do
  # table is a table.hashes.keys # => [:from, :to, :what, :cost, :desc]
  assert page.has_content?(@order.from_city)
  assert page.has_content?(@order.to_city)
  assert page.has_content?(@order.cargo)
  assert page.has_content?(@order.price)
  assert page.has_content?(@order.about)
end

When(/^у клиента есть заказ в статусе open$/) do
  create(:order, user: @user)
end

When(/^он увидит кнопку удалить заказ$/) do
  assert page.has_content?('Удалить заказ')
end

When(/^он нажмёт кнопку удалить заказ$/) do
  click_on('close_order')
end

When(/^статус заказа перейдёт в closed$/) do
  assert page.has_content?('closed')
end

When(/^он перейдёт на страницу просмотра этого заказа$/) do
  visit('/orders/')
  click_on('Информация')
end