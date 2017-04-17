prices = [10000, 150000, 25000, 300000, 50000]
currency = %w($ с ₽ тңг)
cargos = %w(Кофе Орехи Арбузы Лес Топливо)

5.times do |i|
  customer = User.create!(
  	name: Faker::Name.first_name,
  	surname: Faker::Name.last_name,
  	phone: '0555 555 555', 
  	role: 'customer', 
  	email: 'customer' + "#{i}" + '@mail.com',
  	password: 'qweqwe', 
  	password_confirmation: 'qweqwe')

  order = Order.create!(
  	about: Faker::Lorem.sentence,
  	status: 'new',
    from_city: Faker::Address.country + '/' + Faker::Address.city,
    to_city: Faker::Address.country + '/' + Faker::Address.city,
    price: prices.sample.to_s + currency.sample,
    user: customer,
    cargo: cargos.sample)

  worker = User.create!(
  	name: Faker::Name.first_name,
  	surname: Faker::Name.last_name,
  	phone: '0555 555 555',
  	role: 'worker',
  	email: 'worker' + "#{i}" + '@mail.com',
  	password: 'qweqwe',
  	password_confirmation: 'qweqwe')

  Document.create!(
  	title: 'pasport' + "#{i}",
  	user: worker)

  Car.create!(
  	about: 'marka' + "#{i}",
  	user: worker)

  Offer.create!(
  	status: 'new',
  	about: Faker::Lorem.paragraphs,
  	user: worker,
  	order: order)

end

admin = User.create(
	name: 'Admin', 
	surname: 'Adminov', 
	phone: '000000000', 
	role: 'admin', 
	email: 'admin@mail.com', 
	password: 'qweqwe', 
	password_confirmation: 'qweqwe')