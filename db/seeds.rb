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
             password_confirmation: 'password1',
             admin: true,
             activated: true,
             activated_at: Time.zone.now
)

99.times do |num|
  username = Faker::Name.name
  random_date = Faker::Time.between(30.days.ago - 1, DateTime.now)
  email = Faker::Internet.email
  password = 'password'
  User.create!(username: username,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: random_date
  )
end