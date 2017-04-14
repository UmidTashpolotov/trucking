3.times do |i=1|
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
  	user: customer)

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

  i += 1
end

admin = User.create(
	name: 'Admin', 
	surname: 'Adminov', 
	phone: '000000000', 
	role: 'admin', 
	email: 'admin@mail.com', 
	password: 'qweqwe', 
	password_confirmation: 'qweqwe')


  user = User.first

  5.times do |i=1|
    Order.create!(
      about: Faker::Lorem.sentence,
      status: 'new',
      user: user)
    i += 1
  end