# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"
User.destroy_all
User.create(email: "email@gmail.com", password: "123456", first_name: "Example First Name", last_name: "Example Last Name" )
Kitchen.all.each do |kitchen|
  kitchen.photo.purge
end

Kitchen.destroy_all
10.times do
  name = Faker::Food.spice
  address = Faker::Address.state
  description = Faker::Food.description
  capacity = rand(1..3)
  price = [75, 100, 125, 150, 200].sample
  file = URI.open("https://source.unsplash.com/random/?kitchen")
  kitchen = Kitchen.create(name: name, address: address, description: description, capacity: capacity, price: price)
  kitchen.photo.attach(io: file, filename: kitchen.name, content_type: "image/jpg")
  kitchen.user = User.all.sample
  kitchen.save
  p kitchen
end
