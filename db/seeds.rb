# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  random_name = Faker::Hacker.say_something_smart
  random_body = Faker::Lorem.paragraph(6)
  Question.create([{ question_name: "#{random_name[0...random_name.length - 1]}?", question_body: random_body }])
end
