When(/^заказчик выбрал предложение перевозчика$/) do
  @offer.accept
  @order.update(worker: @offer.user)
  @order.in_progress
end

When(/^перевозчик выполнил работу$/) do
  @order.complete
end