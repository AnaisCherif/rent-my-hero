
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

characters = [
  { name: "Abraham Simpson", location: "Springfield", from: "The Simpsons", photo_url: "https://static.wikia.nocookie.net/heros/images/7/7a/Abraham_Simpson_Infobox.jpg/revision/latest?cb=20200917150550&path-prefix=fr" },
  { name: "Harry Potter", location: "Hogwarts", from: "Harry Potter Series" },
  { name: "Frodo Baggins", location: "Shire", from: "The Lord of the Rings" },
  { name: "Jon Snow", location: "Winterfell", from: "Game of Thrones" },
  { name: "Luke Skywalker", location: "Tatooine", from: "Star Wars" },
  { name: "Hermione Granger", location: "Hogwarts", from: "Harry Potter Series" },
  { name: "Aragorn", location: "Gondor", from: "The Lord of the Rings" },
  { name: "Daenerys Targaryen", location: "Dragonstone", from: "Game of Thrones" },
  { name: "Arya Stark", location: "Winterfell", from: "Game of Thrones" },
  { name: "Leia Organa", location: "Alderaan", from: "Star Wars" },
  { name: "Darth Vader", location: "Death Star", from: "Star Wars" },
  { name: "Yoda", location: "Dagobah", from: "Star Wars" },
  { name: "Indiana Jones", location: "Various Locations", from: "Indiana Jones" },
  { name: "Sherlock Holmes", location: "221B Baker Street", from: "Sherlock Holmes" },
  { name: "Han Solo", location: "Millennium Falcon", from: "Star Wars" },
  { name: "Gandalf", location: "Middle-earth", from: "The Lord of the Rings" },
  { name: "Cersei Lannister", location: "King's Landing", from: "Game of Thrones" },
  { name: "Neo", location: "Zion", from: "The Matrix" },
  { name: "Trinity", location: "Zion", from: "The Matrix" },
  { name: "Morpheus", location: "Zion", from: "The Matrix" },
  { name: "Tony Stark", location: "Stark Tower", from: "Iron Man" },
  { name: "Thor", location: "Asgard", from: "Thor" },
  { name: "Peter Parker", location: "New York", from: "Spider-Man" },
  { name: "Clark Kent", location: "Metropolis", from: "Superman" },
  { name: "Bruce Wayne", location: "Gotham City", from: "Batman" },
]

user = User.create!(email: "test@test.com", password: "azerty", first_name: "Test", last_name: "Test")
characters.each do |character|
  Character.create!(
    name: character[:name],
    location: character[:location],
    from: character[:from],
    price: rand(50..1000),
    skills: ["#{Faker::Job.key_skill}, #{Faker::Hobby.activity}"],
    user_id: user.id
  )
end

puts "Finished"
