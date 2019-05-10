# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.times do
    User.create(email: Faker::Name.first_name + "@yopmail.com", description: Faker::Lorem.paragraph, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

1.times do
    Event.create(start_date: "15/05/2019", duration: 100, title: "Festival Rock", description: "Festival annuel de la scène Rock actuelle", price: 28, location: "Paris"
end