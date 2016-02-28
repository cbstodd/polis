# USERS
User.create!(username:              ENV['ADMIN_USERNAME'],
             email:                 ENV['ADMIN_EMAIL'],
             password:              ENV['ADMIN_PASSWORD'],
             password_confirmation: ENV['ADMIN_PASSWORD'],
             summary:               ENV['ADMIN_SUMMARY'],
             admin: true,
             activated: true,
             activated_at: Time.zone.now
)

# 50.times do |num|
#   username =    Faker::Name.name
#   random_date = Faker::Time.between(30.days.ago - 1, DateTime.now)
#   email =       Faker::Internet.email
#   password =    ENV['EXAMPLE_USER_PASSWORD']
#   summary =     Faker::Lorem.paragraph
#   User.create!(username: username,
#                email:    email,
#                password:              password,
#                password_confirmation: password,
#                summary: summary,
#                admin: false,
#                activated: true,
#                activated_at: random_date
#   )
# end


# EVENTS
# users = User.order(:created_at).take(5)
# 1.times do
#   title =      Faker::Lorem.sentence(1)
#   content =    Faker::Lorem.paragraphs.join('<br><br>')
#   event_date = Faker::Date.forward(3)
#   users.each { |user| user.eventposts.create!(title: title,
#                                               content: content,
#                                               event_date: event_date) }
# end



# FOLLOWING RELATIONSHIPS
users =     User.all
user =      users.first
following = users[2..50]
followers = users[5..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }