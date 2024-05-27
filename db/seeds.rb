
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

puts "Start"

Character.destroy_all
User.destroy_all

user = User.create(email: "test@test.com", password:"azerty")

3.times do
  Character.create(
    name: Faker::TvShows::Simpsons.character,
    from: "The Simpsons",
    location: "Springfield",
    price: rand(50..1000),
    skills: ["#{Faker::Job.key_skill}, #{Faker::Hobby.activity}"],
    user_id: user
  )
end

3.times do
  Character.create(
    name: [Faker::DcComics.hero, Faker::DcComics.heroine, Faker::DcComics.villain].sample,
    from: "DC Comics",
    location: Faker::Nation.capital_city,
    price: rand(50..1000),
    skills: ["#{Faker::Job.key_skill}, #{Faker::Hobby.activity}"],
    user_id: user
  )
end

puts "Finished"
