3.times do |i=1|
  customer = User.create!(
  	name: 'User' + "#{i}", 
  	surname: 'Userov' + "#{i}", 
  	phone: '0555 555 555', 
  	role: 'customer', 
  	email: 'customer@mail.com' + "#{i}", 
  	password: 'qweqwe', 
  	password_confirmation: 'qweqwe')

  order = Order.create!(
  	about: 'order' + "#{i}", 
  	status: 'new', 
  	user: customer)

  worker = User.create!(
  	name: 'User' + "#{i}", 
  	surname: 'Userov' + "#{i}", 
  	phone: '0555 555 555', 
  	role: 'worker', 
  	email: 'worker@mail.com' + "#{i}", 
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
  	about: 'offer' + "#{i}", 
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
      about: 'order' + "#{i}", 
      status: 'new', 
      user: user)
    i += 1
  end