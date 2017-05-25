prices = [10000, 150000, 25000, 300000, 50000]
currency = %w($ с ₽ тңг)
cargos = %w(Кофе Орехи Арбузы Лес Топливо)
weights = [100, 200, 500, 1000]
volumes = [1000, 5000, 10000, 20000]
transports = ['до 800кг', '1.5 тонны', '3 тонны', '5 тонн', '10 тонн',
              'фура 20 тонн']

25.times do |i|
  customer = User.create!(
  	name: Faker::Name.first_name,
  	surname: Faker::Name.last_name,
  	phone: '555' + rand(100_000..999_999).to_s,
  	role: 'customer',
  	password: 'qweqwe', 
  	password_confirmation: 'qweqwe',
		active: true)

  order = Order.create!(
  	about: Faker::Lorem.sentence,
    from_city: Faker::Address.country + '/' + Faker::Address.city,
    to_city: Faker::Address.country + '/' + Faker::Address.city,
    price: prices.sample.to_s + currency.sample,
    user: customer,
    cargo: cargos.sample,
  	weight: weights.sample,
  	volume: volumes.sample,
  	transport: transports.sample,
  	departure_date: Faker::Date.between(1.days.from_now, 1.year.from_now),
  	payment_method: 'наличными при разгрузке',
  	temperature_regime: 'от 10 до 25 градусов',
  	loading_type: 'задняя' )

  worker = User.create!(
  	name: Faker::Name.first_name,
  	surname: Faker::Name.last_name,
		phone: '666' + rand(100_000..999_999).to_s,
  	role: 'worker',
  	password: 'qweqwe',
  	password_confirmation: 'qweqwe',
  	active: true)


  Document.create!(
  	title: 'pasport' + "#{i}",
  	user: worker)

  # Car.create!(
  # 	about: 'marka' + "#{i}",
  # 	user: worker)

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
	password: 'qweqwe', 
	password_confirmation: 'qweqwe')