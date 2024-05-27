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
