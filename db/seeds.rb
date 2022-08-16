# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ĐỀ PHÒNG AE NÀO VẪN GIỮ BẢNG IMAGES CŨ NHÉ
# 10.times do |n|
#   Image.create!(
#     image: "/assets/",
#     product_id: Faker::Number.between(from: 8, to: 18),
#   )
# end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ĐỀ PHÒNG AE NÀO VẪN GIỮ BẢNG IMAGES CŨ NHÉ

require 'faker'

5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "foobar"
  password_confirmation = "foobar"
  phone = Faker::PhoneNumber.cell_phone
  address = Faker::Address.street_address
  User.create!(name: name, phone: phone, address: address,
    password: password, password_confirmation: password_confirmation, email: email)
end

Category.create!(name: "Men")
Category.create!(name: "Woman")
puts("create category")
3.times do
  parent_id_1 = 1
  name = Faker::Emotion.noun
  Category.create!(name: name, parent_id: parent_id_1)

  parent_id_2 = 2
  name = Faker::Emotion.noun
  Category.create!(name: name, parent_id: parent_id_2)

  parent_id_3 = 3
  name = Faker::Emotion.noun
  Category.create!(name: name, parent_id: parent_id_3)
end

categories = Category.all
quantity_in_stock = 50
categories.each do |category|
  5.times do
    name = Faker::Nation.language
    product = category.products.create!(name: name, price: 50, quantity_in_stock: quantity_in_stock)
    3.times do 
      Image.create!(
        image: "/assets/",
        product_id: Faker::Number.between(from: 8, to: 18),
      )
    end
  end
end


users = User.all
5.times do
  status = rand(0..4)
  users.each { |user| user.orders.create!(status: status)}
end

orders = Order.all
orders.each do |order|
  rand(1..5).times do
    product_id = rand(1..50)
    order.order_details.create!(product_id: product_id)
  end
end
