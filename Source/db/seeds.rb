# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create!(name:  "Ime Prezime",
             email: "iprezime@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

# Authors
Author.create!(name:  "* Unknown",
               biography: "This is default author.")
             
99.times do
  name  = Faker::Name.name
  biography = Faker::Lorem.paragraph(10)
  Author.create!(name: name,
                 biography: biography)
end

# Quotes
users = User.order(:created_at).take(40)
authors = Author.order(:name).take(40)
30.times do |n|
  content = Faker::Lorem.paragraph(3)
  source = Faker::Lorem.sentence(1)
  comment = Faker::Lorem.paragraph(1)
  author_id = authors[n].id
  users.each { |user| user.quotes.create!(content: content,
                                          source: source,
                                          comment: comment,
                                          author_id: author_id) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

