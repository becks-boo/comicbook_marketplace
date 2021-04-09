# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"

conditions = ["Near Mint", "Very Fine", "Fine", "Very Good", "Good", "Fair", "Poor"]
status = ["Accepted", "Pending", "Declined"]

Purchase.destroy_all
Review.destroy_all
User.destroy_all
ComicBook.destroy_all

10.times do
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
    )
  # save! to show issue and interrupt the save
  user.save!
  puts "Creating #{user.username}"
end

10.times do
  comic_book = ComicBook.new(
    series: Faker::DcComics.title,
    name: Faker::DcComics.name,
    issue: Faker::Number.within(range: 1..100),
    release_date: Faker::Number.within(range: 1930..2021),
    writer: Faker::Book.author,
    artist: Faker::Artist.name,
    location: Faker::Address.city,
    quantity: rand(1..9),
    price: Faker::Commerce.price,
    condition: conditions.sample.to_s,
    description: Faker::JapaneseMedia::OnePiece.quote,
    user_id: User.all.sample.id
    )
  # save! to show issue and interrupt the save
  comic_book.save!
  puts "Comic books created!"
end

count = 0

4.times do
  comic_book = ComicBook.all.sample

  purchase = Purchase.new(
    status: status.sample.to_s,
    value: comic_book.price,
    comic_book_id: comic_book.id,
    user_id: User.all.sample.id
    )
  purchase.save!
  puts "Purchase number #{count += 1} created!"
end

4.times do
  comic_book = ComicBook.all.sample

  review = Review.new(
    description: Faker::Quote.yoda,
    rating: rand(1..5),
    author_id: User.all.sample.id,
    seller_id: comic_book.user_id
    )
  review.save!
  puts "Reviews created!"
end

