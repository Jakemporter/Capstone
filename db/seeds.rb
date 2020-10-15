# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: "Jake", last_name: "Porter", username: "jake123", email: "Jake@example.com", password: "password", admin: true)
User.create!(first_name: "Lexie", last_name: "Campbell", username: "Lex0612", email: "Lex@example.com", password: "password")


Car.create!(make: "Porsche", model: "911 Turbo S", color: "Red", year: "2017", description: "Engine: 3.8L DOHC 24-valve flat-6/540 hp @ 6,400 rpm, 523 lb-ft @ 2,250-4,000 rpm; 580 hp @ 6,750 rpm, 553 lb-ft @ 2,250-4,000 rpm Transmission: 7-speed dual-clutch automatic", miles: 12000, user_id: 1 )

Car.create!(make: "Land Rover", model: "Range Rover LWB Autobiography", color: "grey", year: "2018", description: "Engine: 5.0L V8 Horsepower: 518hp @ 6000 rpm Torque: 461 lb-ft @ 2500 rpm", miles: 22000, user_id: 2)

Image.create!(car_id: 1, url: "https://www.carpixel.net/w/32db4bb5bc41b36d585fc999ad81e87d/porsche-911-turbo-s-car-wallpaper-57036.jpg")

Image.create!(car_id: 2, url: "https://cnet3.cbsistatic.com/img/UEbuhFHiXorCksr0h2r8mGpWk68=/0x0:2736x1598/1200x675/2018/06/20/37fefc07-08b6-4a9e-be71-b2b1da73882a/2018-range-rover-10.jpg")

Category.create!(name: "Luxury")
Category.create!(name: "Sport")

CategoryCar.create!(category_id: 1, car_id: 1)
CategoryCar.create!(category_id: 2, car_id: 1)
CategoryCar.create!(category_id: 1, car_id: 2)
