# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'cbstodd',
             email: 'cbstodd@gmail.com',
             password: 'password1',
             password_confirmation: 'password1'
)

99.times do |num|
  username = Faker::Name.name
  email = Faker::Internet.email
  password = 'password'
  User.create!(username: username,
               email: email,
               password: password,
               password_confirmation: password
  )
end