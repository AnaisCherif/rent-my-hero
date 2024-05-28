
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

Booking.destroy_all
Character.destroy_all
User.destroy_all

characters = [
  { name: "Abraham Simpson", location: "Springfield", from: "The Simpsons", photo_url: "https://static.wikia.nocookie.net/heros/images/7/7a/Abraham_Simpson_Infobox.jpg/revision/latest?cb=20200917150550&path-prefix=fr" },
  { name: "Harry Potter", location: "Hogwarts", from: "Harry Potter Series", photo_url: "https://upload.wikimedia.org/wikipedia/en/d/d7/Harry_Potter_character_poster.jpg" },
  { name: "Frodo Baggins", location: "Shire", from: "The Lord of the Rings", photo_url: "https://upload.wikimedia.org/wikipedia/en/8/87/Frodo_Baggins.jpeg" },
  { name: "Jon Snow", location: "Winterfell", from: "Game of Thrones", photo_url: "https://upload.wikimedia.org/wikipedia/en/3/30/Jon_Snow_Season_8.png" },
  { name: "Luke Skywalker", location: "Tatooine", from: "Star Wars", photo_url: "https://upload.wikimedia.org/wikipedia/en/9/9b/Luke_Skywalker.png" },
  { name: "Hermione Granger", location: "Hogwarts", from: "Harry Potter Series", photo_url: "https://upload.wikimedia.org/wikipedia/en/d/d3/Hermione_Granger_poster.jpg" },
  { name: "Aragorn", location: "Gondor", from: "The Lord of the Rings", photo_url: "https://upload.wikimedia.org/wikipedia/en/0/0c/Aragorn300ppx.jpg" },
  { name: "Daenerys Targaryen", location: "Dragonstone", from: "Game of Thrones", photo_url: "https://upload.wikimedia.org/wikipedia/en/1/1e/Daenerys_Targaryen.jpg" },
  { name: "Arya Stark", location: "Winterfell", from: "Game of Thrones", photo_url: "https://upload.wikimedia.org/wikipedia/en/3/39/Arya_Stark-Maisie_Williams.jpg" },
  { name: "Leia Organa", location: "Alderaan", from: "Star Wars", photo_url: "https://upload.wikimedia.org/wikipedia/en/1/1b/Princess_Leia's_cinematography.jpg" },
  { name: "Darth Vader", location: "Death Star", from: "Star Wars", photo_url: "https://upload.wikimedia.org/wikipedia/en/7/76/Darth_Vader.jpg" },
  { name: "Yoda", location: "Dagobah", from: "Star Wars", photo_url: "https://upload.wikimedia.org/wikipedia/en/9/9b/Yoda_Empire_Strikes_Back.png" },
  { name: "Indiana Jones", location: "Various Locations", from: "Indiana Jones", photo_url: "https://upload.wikimedia.org/wikipedia/en/d/d4/Indiana_Jones_in_Raiders_of_the_Lost_Ark.jpg" },
  { name: "Sherlock Holmes", location: "221B Baker Street", from: "Sherlock Holmes", photo_url: "https://upload.wikimedia.org/wikipedia/commons/5/53/Dr_John_Watson_%28Martin_Freeman%29_and_Sherlock_Holmes_%28Benedict_Cumberbatch%29.jpg" },
  { name: "Han Solo", location: "Millennium Falcon", from: "Star Wars", photo_url: "https://upload.wikimedia.org/wikipedia/en/6/6f/Han_Solo_Star_Wars.png" },
  { name: "Gandalf", location: "Middle-earth", from: "The Lord of the Rings", photo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/e/e9/Gandalf600ppx.jpg/220px-Gandalf600ppx.jpg" },
  { name: "Cersei Lannister", location: "King's Landing", from: "Game of Thrones", photo_url: "https://upload.wikimedia.org/wikipedia/en/9/94/Cersei_Lannister-Lena_Headey.jpg" },
  { name: "Neo", location: "Zion", from: "The Matrix", photo_url: "https://upload.wikimedia.org/wikipedia/en/c/c6/NeoTheMatrix.jpg" },
  { name: "Trinity", location: "Zion", from: "The Matrix", photo_url: "https://upload.wikimedia.org/wikipedia/en/c/cf/Trinity-Matrix.jpg" },
  { name: "Morpheus", location: "Zion", from: "The Matrix", photo_url: "https://upload.wikimedia.org/wikipedia/en/a/a7/Morpheus.jpg" },
  { name: "Tony Stark", location: "Stark Tower", from: "Iron Man", photo_url: "https://upload.wikimedia.org/wikipedia/en/e/e0/Tony_Stark_in_Iron_Man_3.jpg" },
  { name: "Thor", location: "Asgard", from: "Thor", photo_url: "https://upload.wikimedia.org/wikipedia/en/f/fc/Thor_poster.jpg" },
  { name: "Peter Parker", location: "New York", from: "Spider-Man", photo_url: "https://upload.wikimedia.org/wikipedia/en/0/0c/Spiderman50.jpg" },
  { name: "Clark Kent", location: "Metropolis", from: "Superman", photo_url: "https://upload.wikimedia.org/wikipedia/en/3/35/Supermanflying.png" },
  { name: "Bruce Wayne", location: "Gotham City", from: "Batman", photo_url: "https://upload.wikimedia.org/wikipedia/en/8/87/Batman_DC_Comics.png" },
]

user = User.create!(email: "test@test.com", password: "azerty", first_name: "Test", last_name: "Test")
characters.each do |character|
  Character.create!(
    name: character[:name],
    location: character[:location],
    from: character[:from],
    photo_url: character[:photo_url],
    price: rand(50..1000),
    skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}",
    user_id: user.id
  )
end

puts "Finished"
