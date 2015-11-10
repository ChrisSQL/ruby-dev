# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Chris Maher",
             email: "a@a.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             college_name: "Waterford IT",
             course_name: "Software Systems Development",
             activated_at: Time.zone.now)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@collegeplanner.ie"
  password = "password"
  college_name = Faker::University.name
  course_name = Faker::Lorem.sentence(1)
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               college_name: college_name,
               course_name: course_name,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
25.times do
  content = Faker::Lorem.sentence(1)
  subject = Faker::Lorem.word
  type = Faker::Lorem.word
  worth = Faker::Number.between(1,100)
  duedate = Faker::Date.forward(60)
  details = Faker::Lorem.sentence(20)
  users.each { |user| user.projects.create!(project_title: content,
                                            project_subject: subject,
                                            project_type: type,
                                            project_worth: worth,
                                            project_due_date: duedate,
                                            project_details: details) }
end

users = User.order(:created_at).take(25)
1.times do

  author_email = Faker::Internet.email
  note_subject = Faker::Lorem.word
  note_details = Faker::Hacker.say_something_smart
  users.each { |user| user.groups.create!(author_email: author_email,
                                          note_subject: note_subject,
                                          note_details: note_details) }
end


users = User.order(:created_at).take(6)
1.times do
  name = Faker::Lorem.sentence(1)
  attachment = Faker::Lorem.word
  users.each { |user| user.timetables.create!(name: name,
                                            attachment: attachment) }
end



