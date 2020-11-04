# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: "Jake", last_name: "Porter", username: "jake123", email: "Jake@example.com", password: "password", admin: true)
User.create!(first_name: "Lexie", last_name: "Campbell", username: "Lex0612", email: "Lex@example.com", password: "password")


Car.create!(make: "Porsche", model: "911 Turbo S", color: "Grey", year: "2017", description: "Engine: 3.8L DOHC 24-valve flat-6/540 hp @ 6,400 rpm, 523 lb-ft @ 2,250-4,000 rpm; 580 hp @ 6,750 rpm, 553 lb-ft @ 2,250-4,000 rpm Transmission: 7-speed dual-clutch automatic", miles: 12000, user_id: 1 )

Car.create!(make: "Land Rover", model: "Range Rover LWB Autobiography", color: "Grey", year: "2018", description: "Engine: 5.0L V8 Horsepower: 518hp @ 6000 rpm Torque: 461 lb-ft @ 2500 rpm", miles: 22000, user_id: 2)
#Porche Images
Image.create!(car_id: 1, url: "https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/images/15q4/662481/2017-porsche-911-turbo-and-turbo-s-photos-and-info-news-car-and-driver-photo-664482-s-original.jpg")

Image.create!(car_id: 1, url: "https://s1.cdn.autoevolution.com/images/news/2017-porsche-911-turbo-detroit-live-photos-103566_1.jpg")

Image.create!(car_id: 1, url: "https://i.ytimg.com/vi/FsrHcehtZRc/maxresdefault.jpg")

#Range Rover Images
Image.create!(car_id: 2, url: "https://cnet3.cbsistatic.com/img/UEbuhFHiXorCksr0h2r8mGpWk68=/0x0:2736x1598/1200x675/2018/06/20/37fefc07-08b6-4a9e-be71-b2b1da73882a/2018-range-rover-10.jpg")

Image.create!(car_id: 2, url: "https://cnet4.cbsistatic.com/img/i5D6Sia7ztDtqpqMqf4MLSIJ5rw=/2018/06/19/d06bc9e1-b5d9-4a89-8f1d-3dbc73e9277c/land-rover-5ttk0.jpg")

Image.create!(car_id: 2, url: "https://cnet2.cbsistatic.com/img/5rTrRwO42gvBPUuhFXI9uuKWbdM=/2018/06/20/45da618e-dee2-4650-a1d8-ee42803efd81/2018-range-rover-ogi2.jpg")

Category.create!(name: "Luxury")
Category.create!(name: "Sport")

CategoryCar.create!(category_id: 1, car_id: 1)
CategoryCar.create!(category_id: 2, car_id: 1)
CategoryCar.create!(category_id: 1, car_id: 2)
