# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"

User.destroy_all
ComicBook.destroy_all
Purchase.destroy_all

10.times do
  user = User.new(
    username: Faker::Book.title,
    email: Faker::Internet.email,
    password: "123456"
    )

user.save
puts "Creating #{user.username}"
end
