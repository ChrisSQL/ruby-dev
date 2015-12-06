# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Chris Maher",
             email: "chris@wit.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             college_name: "Waterford IT",
             course_name: "Software Systems Development",
             activated_at: Time.zone.now)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@wit.ie"
  password = "foobar"
  college_name = "Waterford IT"
  course_name = "Software Systems Development"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               college_name: college_name,
               course_name: course_name,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(5)
1.times do
  title = "Android Project"
  subject = "Android"
  type = "Project"
  worth = Faker::Number.between(20,100)
  duedate = Faker::Date.forward(60)
  details = Faker::Hacker.say_something_smart
  users.each { |user| user.projects.create!(project_title: title,
                                            project_subject: subject,
                                            project_type: type,
                                            project_worth: worth,
                                            project_due_date: duedate,
                                            project_details: details) }
end

users = User.order(:created_at).take(5)
1.times do
  title = "Rails Project"
  subject = "Rails"
  type = "Project"
  worth = Faker::Number.between(20,100)
  duedate = Faker::Date.forward(60)
  details = Faker::Hacker.say_something_smart
  users.each { |user| user.projects.create!(project_title: title,
                                            project_subject: subject,
                                            project_type: type,
                                            project_worth: worth,
                                            project_due_date: duedate,
                                            project_details: details) }
end

users = User.order(:created_at).take(5)
1.times do
  title = "Ruby Project"
  subject = "Ruby"
  type = "Project"
  worth = Faker::Number.between(20,100)
  duedate = Faker::Date.forward(60)
  details = Faker::Hacker.say_something_smart
  users.each { |user| user.projects.create!(project_title: title,
                                            project_subject: subject,
                                            project_type: type,
                                            project_worth: worth,
                                            project_due_date: duedate,
                                            project_details: details) }
end

users = User.order(:created_at).take(5)
1.times do
  title = "Databases Project"
  subject = "Databases"
  type = "Project"
  worth = Faker::Number.between(20,100)
  duedate = Faker::Date.forward(60)
  details = Faker::Hacker.say_something_smart
  users.each { |user| user.projects.create!(project_title: title,
                                            project_subject: subject,
                                            project_type: type,
                                            project_worth: worth,
                                            project_due_date: duedate,
                                            project_details: details) }
end

users = User.order(:created_at).take(10)
1.times do

  author_email = Faker::Internet.email
  note_subject = "Attention Classmates"
  note_details = Faker::Hacker.say_something_smart
  users.each { |user| user.groups.create!(author_email: author_email,
                                          note_subject: note_subject,
                                          note_details: note_details) }
end


# users = User.order(:created_at).take(5)
# 1.times do
#   name = "Timetable"
#   attachment = "http://localhost:3000/uploads/timetable/attachment/6/Screenshot_from_2015-11-11_00_10_16.png"
#   users.each { |user| user.timetables.create!(name: name,
#                                             attachment: attachment) }
# end



