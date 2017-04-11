3.times do |i=1|
  User.create(name: 'User' + "#{i}", surname: 'Userov' + "#{i}", phone: '0555 555 555', role: 'worker')
  i += 1
end

3.times do |i=1|
  User.create(name: 'User' + "#{i}", surname: 'Userov' + "#{i}", phone: '0555 555 555', role: 'customer')
  i += 1
end

users = User.all
3.times do |i=0|
  Document.create(title: 'pasport' + "#{i}", user: users[i])
end

3.times do |i=0|
  Car.create(about: 'marka' + "#{i}", user: users[i])
end

admin = User.create(name: 'Admin', surname: 'Adminov', phone: '000000000', role: 'admin')