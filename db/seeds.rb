
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
require "open-uri"

puts "Start"

Booking.destroy_all
Character.destroy_all
User.destroy_all

user = User.create!(email: "test@test.com", password: "azerty", first_name: "Test", last_name: "Test")

characters = [
  { name: "Abraham Simpson", location: "Springfield", univers: "The Simpsons", photo_url: "https://www.simpsonspark.com/images/persos/contributions/abraham-simpson-22960.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Harry Potter", location: "Hogwarts", univers: "Harry Potter Series", photo_url: "https://resize.elle.fr/square/var/plain_site/storage/images/loisirs/livres/news/harry-potter-de-nouveaux-secrets-devoiles-2913738/53231812-1-fre-FR/Harry-Potter-de-nouveaux-secrets-devoiles.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Lucille Bluth", location: "Newport Beach", univers: "Arrested Development", photo_url: "https://pyxis.nymag.com/v1/imgs/7f8/34f/d2574f13c7fcafb9b2d16897008caf7edd-lucille-bluth.rsquare.w400.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "BoJack Horseman", location: "Hollywoo", univers: "BoJack Horseman", photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuOzCSMmTs89nZ44CuAzNhFLJmSBMKSkWrBqZVeCYvIg&s", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Jon Snow", location: "Winterfell", univers: "Game of Thrones", photo_url: "https://pyxis.nymag.com/v1/imgs/bae/9eb/664ad57e704e648661d28a4590b0b176a4-12-jon-snow.2x.rsquare.w536.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Neo", location: "Zion", univers: "The Matrix", photo_url: "https://upload.wikimedia.org/wikipedia/en/c/c6/NeoTheMatrix.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Hermione Granger", location: "Hogwarts", univers: "Harry Potter Series", photo_url: "https://i.pinimg.com/736x/cc/25/94/cc259481cf5ab8f4fa3462f5603f613a.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Liz Lemon", location: "New York City", univers: "30 Rock", photo_url: "https://pyxis.nymag.com/v1/imgs/444/e02/feedb072bd04abfa22a3053a562e4bb4c8-27-30rock3.rsquare.w400.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Princess Carolyn", location: "Hollywoo", univers: "BoJack Horseman", photo_url: "https://pyxis.nymag.com/v1/imgs/897/4aa/e1547854e6a546b9c11a13317ca19bf6f4-08-bojack-409.rsquare.w400.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Daenerys Targaryen", location: "Dragonstone", univers: "Game of Thrones", photo_url: "https://www.femalefirst.co.uk/image-library/square/500/g/game-of-thrones-season-6-now-daenerys-targaryen.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Rick Sanchez", location: "Dimension C-137", univers: "Rick and Morty", photo_url: "https://pyxis.nymag.com/v1/imgs/dcb/698/eea6b585943cfb9f9ce6048e514f174dbc-The-Old-Man-and-the-Seat.1x.rsquare.w1400.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Leia Organa", location: "Alderaan", univers: "Star Wars", photo_url: "https://www.francetvinfo.fr/pictures/xyCfYtD6tZoJIMFaSDymh4_DSO4/1200x1200/2019/12/11/phppGEuDy.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Yoda", location: "Dagobah", univers: "Star Wars", photo_url: "https://upload.wikimedia.org/wikipedia/en/9/9b/Yoda_Empire_Strikes_Back.png", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Gandalf", location: "Middle-earth", univers: "The Lord of the Rings", photo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/e/e9/Gandalf600ppx.jpg/220px-Gandalf600ppx.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Clark Kent", location: "Metropolis", univers: "Superman", photo_url: "https://www.francetvinfo.fr/pictures/ZZdUwxSIZmCaeBI_cxPGpl68Dps/1200x1200/2013/06/19/041_MAN364AU.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Bruce Wayne", location: "Gotham City", univers: "Batman", photo_url: "https://media.architecturaldigest.com/photos/622a1dffb39072781eaf9e5f/1:1/w_4000,h_4000,c_limit/rev-1-TBM-63105r_High_Res_JPEG.jpeg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Walter White", location: "Albuquerque", univers: "Breaking Bad", photo_url: "https://hips.hearstapps.com/esq.h-cdn.co/assets/16/26/480x480/square-1467224019-54d447ac41a88-walterdef.jpg?resize=640:*", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Don Draper", location: "New York City", univers: "Mad Men", photo_url: "https://media.gq-magazine.co.uk/photos/62deab8f462bbdd05e0f7dc0/1:1/w_2400,h_2400,c_limit/TCDMAM2_EC070.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Michael Scott", location: "Scranton", univers: "The Office", photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-BUDZ2rWAGLNFM8GrOFQ8WIWIHMVkNJDp68lF255AZg&s", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Summer Smith", location: "Dimension C-137", univers: "Rick and Morty", photo_url: "https://images.squarespace-cdn.com/content/v1/5616ac17e4b018d366f57f53/1616952566614-0IEBMBBMXMO30Z37PTMN/summer+smith+soundboard", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Diane Nguyen", location: "Hollywoo", univers: "BoJack Horseman", photo_url: "https://pyxis.nymag.com/v1/imgs/c5c/aeb/2666c88cd7e1c1ded801ea49f60d89eb90-24-diane-bojack.rsquare.w400.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Rachel Green", location: "New York City", univers: "Friends", photo_url: "https://cdn.mos.cms.futurecdn.net/whowhatwear/posts/294687/rachel-green-green-dress-294687-1628691750563-square.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
  { name: "Dwight Schrute", location: "Scranton", univers: "The Office", photo_url: "https://upload.wikimedia.org/wikipedia/en/c/cd/Dwight_Schrute.jpg", price: rand(50..1000), skills: "#{Faker::Job.key_skill}, #{Faker::Hobby.activity}", user_id: user.id },
]

characters.each do |character|
  c = Character.new(character)
  c.save!
  file = URI.open(character[:photo_url])
  c.photo.attach(io: file, filename: c.name)
  c.save!
end

puts "Finished"
