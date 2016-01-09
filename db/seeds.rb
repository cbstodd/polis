# USERS
User.create!(username: 'cbstodd',
             email: 'cbstodd@gmail.com',
             password: 'password1',
             password_confirmation: 'password1',
             admin: true,
             activated: true,
             activated_at: Time.zone.now
)

50.times do |num|
  username = Faker::Name.name
  random_date = Faker::Time.between(30.days.ago - 1, DateTime.now)
  email = Faker::Internet.email
  password = 'password'
  User.create!(username: username,
               email: email,
               password: password,
               password_confirmation: password,
               admin: false,
               activated: true,
               activated_at: random_date
  )
end


# EVENTS
users = User.order(:created_at).take(50)
10.times do
  title = Faker::Lorem.sentence(1)
  content = Faker::Lorem.paragraphs.join('<br><br>')
  users.each { |user| user.eventposts.create!(title: title, content: content) }
end

# FOLLOWING RELATIONSHIPS
users = User.all
user = users.first
following = users[2..50]
followers = users[5..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }