# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product1 = Product.create(name: "book", is_imported: false, tax: 0)
product2 = Product.create(name: "music CD", is_imported: false, tax: 10)
product3 = Product.create(name: "chocolate bar", is_imported: false, tax: 0)
product4 = Product.create(name: "box of chocolates", is_imported: false, tax: 0)
product5 = Product.create(name: "bottle of perfume", is_imported: false, tax: 10)
product6 = Product.create(name: "packet of headache pills", is_imported: false, tax: 0)
product1 = Product.create(name: "book", is_imported: true, tax: 5)
product2 = Product.create(name: "music CD", is_imported: true, tax: 15)
product3 = Product.create(name: "chocolate bar", is_imported: true, tax: 5)
product4 = Product.create(name: "box of chocolates", is_imported: true, tax: 5)
product5 = Product.create(name: "bottle of perfume", is_imported: true, tax: 15)
product6 = Product.create(name: "packet of headache pills", is_imported: true, tax: 5)