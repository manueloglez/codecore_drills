# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../lib/stdout_helpers'



NUM_OF_USERS = 20

PASSWORD = 'supersecret'

User.destroy_all()

super_user = User.create(
    first_name: 'jon',
    last_name: 'snow',
    email: 'js@winterfell.gov',
    password: PASSWORD,
    admin: true,
    activated: true,
    activated_at: Time.zone.now
  )
  
  # NUM_OF_USERS.times do |x|
  #   u = User.create({
  #     first_name: Faker::Games::SuperSmashBros.fighter,
  #     last_name: Faker::Name.last_name,
  #     email: Faker::Internet.email,
  #     password: PASSWORD,
  #     activated: true,
  #     activated_at: Time.zone.now
  #   })
  #   Stdout.progress_bar(NUM_OF_USERS, x, "█") { "Creating Users" }
  # end
  
  # users = User.all



  # puts Cowsay.say("Generated #{users.count}  users!", :turtle)
  puts Cowsay.say("Generated #{super_user}  super_user", :tux)