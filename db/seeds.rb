# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 4.times do |n|
#   Category.create!(
#     name: Faker::Lorem.sentence(word_count: 2),
#     parent_id: Faker::Number.decimal_part(digits: 1),
#     parent_path: Faker::Number.decimal_part(digits: 1),
#   )
# end

# 20.times do |n|
#   Product.create!(
#     name: Faker::Name.name_with_middle,
#     price: Faker::Number.number(digits: 3),
#     description: Faker::Lorem.sentence(word_count: 5),
#     quantity_in_stock: 10,
#     category_id: 1
#   )
# end
10.times do |n|
  Image.create!(
    image: "/assets/",
    product_id: Faker::Number.between(from: 1, to: 5),
  )
end