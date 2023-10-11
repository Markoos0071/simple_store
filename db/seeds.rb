# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"
require_relative '../config/environment'

#676.times do
#  product = Product.create(title: Faker::Commerce.product_name, price: Faker::Commerce.price,
#                            stock_quantity: Faker::Number.number(digits: 3))
#end

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |row|

  category = Category.find_or_create_by(name: row['category'])

  product = category.products.create(title: row['name'],
                                      description: row['description'],
                                      price: row['price'],
                                      stock_quantity: row['stock quantity'])

end