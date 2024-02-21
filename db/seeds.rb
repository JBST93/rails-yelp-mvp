# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Restaurant.destroy_all

puts "Starting to populate DB"
5.times do
  restaurant = Restaurant.create(
    name: Faker::Creature::Animal.name ,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese","french","belgian"].sample
  )
  puts "#{restaurant.name} has been added to the DB"

  2.times do
    puts "Adding Review for #{restaurant.name}"

    review = Review.create(
      content: Faker::Markdown.emphasis,
      rating: [0..5].sample,
      restaurant_id: restaurant[:id]
    )

  puts "Reviews added "
  end

end

puts "DB has been populated"
