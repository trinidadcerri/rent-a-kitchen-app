# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

########### Faker
# Kitchen.all.each do |kitchen|
#   kitchen.photo.purge
# end

# Kitchen.destroy_all
# 10.times do
#   name = Faker::Food.spice
#   address = Faker::Address.state
#   description = Faker::Food.description
#   capacity = rand(1..3)
#   price = [75, 100, 125, 150, 200].sample
#   file = URI.open("https://source.unsplash.com/random/?kitchen")
#   kitchen = Kitchen.create(name: name, address: address, description: description, capacity: capacity, price: price)
#   kitchen.photo.attach(io: file, filename: kitchen.name, content_type: "image/jpg")
#   kitchen.user = User.all.sample
#   kitchen.save
#   p kitchen
# end

########### Users
User.destroy_all
User.create(email: "user@example.com", password: "123456", first_name: "Example First Name", last_name: "Example Last Name" )

########### Kitchens
puts "Cleaning database..."
Kitchen.destroy_all

puts "Creating kitchens..."
##
orange_kitchen = {user_id: User.last.id, name: "Orange kitchen", address: "Seumestraße 4, 10245 Berlin", description: "The orange kitchen is a spacious, vibrantly colored kitchen. It has two wall ovens and plenty of counter space for cooking. The view from the window is open to the garden so you and your guests can get some air while cooking!", capacity: 5, price: 100 }
first_kitchen = Kitchen.new(orange_kitchen)
first_kitchen.photo.attach(io: File.open("app/assets/images/ORANGE_KITCHEN.jpg"), filename: first_kitchen.name, content_type: "image/jpg")
first_kitchen.save!
##
two_ovens_kitchen = {user_id: User.last.id, name: "2 oven's kitchen", address: "Viktoria-Luise-Platz 5, 10777 Berlin", description: "This kitchen is perfect if you want to cook sweet recipes, make pastries or any other preparation that requires the use of the oven in different stages. Besides having plenty of oven space, its light colors make it beautiful. We are waiting for your reservation!", capacity: 7, price: 120 }
second_kitchen = Kitchen.new(two_ovens_kitchen)
second_kitchen.photo.attach(io: File.open("app/assets/images/TWO_OVENS_KITCHEN.jpg"), filename: second_kitchen.name, content_type: "image/jpg")
second_kitchen.save!
##
big_kitchen = {user_id: User.last.id, name: "Big kitchen", address: "Sredzkistraße 1, 10435 Berlin", description: "We are very happy to be able to share this beautiful kitchen with you. It took us a long time to build this space in the back garden of the house and we did it only for one purpose: to have many guests! This kitchen can receive more than 12 people you want to entertain. We have had a good time here, we hope you will too!", capacity: 12, price: 350 }
third_kitchen = Kitchen.new(big_kitchen)
third_kitchen.photo.attach(io: File.open("app/assets/images/BIG_KITCHEN.jpg"), filename: third_kitchen.name, content_type: "image/jpg")
third_kitchen.save!
##
medium_kitchen = {user_id: User.last.id, name: "Medium size kitchen", address: "Zossener Str. 44, 10961 Berlin", description: "This beautiful Scandinavian style kitchen is perfect for having friends over for tea and baking them a nice cake. The size is comfortable for a medium sized group and since it is integrated to the environment you can finish cooking while they start drinking tea or the drink of their choice. It will be a pleasure to have people cooking at home!", capacity: 4, price: 100 }
fourth_kitchen = Kitchen.new(medium_kitchen)
fourth_kitchen.photo.attach(io: File.open("app/assets/images/MEDIUM_KITCHEN.jpg"), filename: fourth_kitchen.name, content_type: "image/jpg")
fourth_kitchen.save!
##
colorful_kitchen = {user_id: User.last.id, name: "Colorful kitchen", address: "Wolfener Str. 33, 12681 Berlin", description: "We love our vibrantly colored kitchen! As you can see in the photo our kitchen has a unique energy! We hope your experience cooking here is as beautiful as ours. You are invited to use it for hours making your best creations. We look forward to seeing you!", capacity: 3, price: 200 }
fifth_kitchen = Kitchen.new(colorful_kitchen)
fifth_kitchen.photo.attach(io: File.open("app/assets/images/COLORFUL_KITCHEN.jpg"), filename: fifth_kitchen.name, content_type: "image/jpg")
fifth_kitchen.save!
##
sunny_kitchen = {user_id: User.last.id, name: "Sunny kitchen", address: "Neumagener Str. 49, 13088 Berlin", description: "Getting up to have our morning coffee with this light and this view is a unique experience for us and we wanted to share it with the world. We have created a small space that integrates nature, sunlight and modern design in our kitchen. Come and cook your best savory dishes, you can enjoy our beautiful garden while you wait :)", capacity: 5, price: 180 }
sixth_kitchen = Kitchen.new(sunny_kitchen)
sixth_kitchen.photo.attach(io: File.open("app/assets/images/SUNNY_KITCHEN.jpg"), filename: sixth_kitchen.name, content_type: "image/jpg")
sixth_kitchen.save!
##
small_kitchen = {user_id: User.last.id, name: "Small kitchen", address: "Gnomenpl. 14, 13088 Berlin", description: "If you and your partner share an apartment, don't have space to cook for each other and are looking for a moment to treat him or her... This is your best opportunity! Enjoy our kitchen, while you have a long chat and a glass of wine. It is located in a quiet neighborhood, so getting lost in traffic to get there is not an option!", capacity: 2, price: 70 }
seventh_kitchen = Kitchen.new(small_kitchen)
seventh_kitchen.photo.attach(io: File.open("app/assets/images/SMALL_KITCHEN.jpeg"), filename: seventh_kitchen.name, content_type: "image/jpg")
seventh_kitchen.save!
##
family_kitchen = {user_id: User.last.id, name: "Family kitchen", address: "Baerwaldstraße 16, 10961 Berlin", description: "Our big family wants to share their space so that you can feel at ease cooking like at home. Savory, sweet or any kind of dishes, you now have the space to create them. The kitchen was old and had no style, we took all last year to modernize it and this is our best result. We can't wait for you to come and work your magic!", capacity: 10, price: 225 }
eighth_kitchen = Kitchen.new(family_kitchen)
eighth_kitchen.photo.attach(io: File.open("app/assets/images/FAMILY_KITCHEN.jpg"), filename: eighth_kitchen.name, content_type: "image/jpg")
eighth_kitchen.save!
##
lovely_kitchen = {user_id: User.last.id, name: "Lovely kitchen", address: "Naunynstraße 33, 10999 Berlin", description: "The space was dark and, with a small window, everything changed. We decided to modernize it further and this was the final result. The green plant and the contrast of the chairs make the kitchen divine. You have a big bar to knead, season or prepare whatever you want. It is located in the middle of the center so in 10 minutes you will be preparing your best dishes. We are waiting for you with your reservation for the weekend!", capacity: 3, price: 95 }
ninth_kitchen = Kitchen.new(lovely_kitchen)
ninth_kitchen.photo.attach(io: File.open("app/assets/images/LOVELY_KITCHEN.jpg"), filename: ninth_kitchen.name, content_type: "image/jpg")
ninth_kitchen.save!
##
puts "Finished!"
##########
