# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Chris Maher",
             email: "chrismaher@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@collegeplanner.ie"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(1)
  subject = Faker::Lorem.word
  type = Faker::Lorem.word
  worth = Faker::Number.between(1,100)
  duedate = Faker::Date.forward(60)
  details = Faker::Lorem.sentence(20)
  users.each { |user| user.projects.create!(projectTitle: content, projectSubject: subject, projectType: type, projectWorth: worth, projectDueDate: duedate, projectDetails: details) }
end

