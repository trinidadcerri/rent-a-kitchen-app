# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
10.times do
  name = Faker::Name.unique.name
  address = Faker::Address.street_name
  description = Faker::Name.name
  capacity = rand(1..3)
  price = [75, 100, 125, 150, 200].sample
  photo_url = 'https://images.unsplash.com/photo-1494526585095-c41746248156?w=1200'
  Kitchen.create(name: name, address: address, description: description, capacity: capacity, price: price, photo_url: photo_url)
  puts "kitchens created"
end
