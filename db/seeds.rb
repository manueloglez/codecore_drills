# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "123"
Point.delete_all
Answer.delete_all
Drill.delete_all
Drillgroup.delete_all
User.delete_all

super_user = User.create(
  first_name: "Anson",
  last_name: "Lam",
  email: "anson@lam.com",
  password: PASSWORD,
  is_admin: true,
  is_active: true
)

8.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: PASSWORD,
    is_admin: false,
    is_active: true
  )
end

users = User.all
levels = ["Beginner", "Intermediate", "Advanced"]

10.times do 
  group = Drillgroup.create(
    title: Faker::Superhero.name,
    description: Faker::Lorem.paragraph_by_chars(number: rand(30..70)),
    level: levels.sample,
    value: rand(0..20) * 100,
  )

  if group.valid?
    group.drills = rand(1..10).times.map do
      answers = rand(1..3).times.map do
        Answer.new(
          description: Faker::Lorem.paragraph_by_chars(number: rand(5..15))
        )
      end
      Drill.new(
        description: Faker::Lorem.paragraph_by_chars(number: rand(15..30)),
        answers: answers
      )
    end
    group.points = users.shuffle.slice(0, rand(users.count)).each.map do |user|
      Point.new(
        user: user,
        score: rand(0..100),
        taken: rand(0..5),
      )
    end
  end
end

puts Cowsay.say("Sign in with #{super_user.email} and password: #{PASSWORD}", :cow)
puts Cowsay.say("Generated #{User.count} users", :ghostbusters)