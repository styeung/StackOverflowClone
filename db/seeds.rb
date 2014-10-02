# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  random_name = Faker::Hacker.say_something_smart
  random_body = Faker::Lorem.paragraph(6)
  Question.create({ question_name: "#{random_name[0...random_name.length - 1]}?", question_body: random_body })
end

(1..50).each do |num|
  3.times do
    random_answer = Faker::Lorem.paragraph(4)
    Answer.create({ question_id: num, answer_text: random_answer })
  end
end

800.times do
  Upvote.create({answer_id: Random.rand(149) + 1})
end
