# Testing associations with Dummy Data
require 'faker'
User.destroy_all
Show.destroy_all
UserShow.destroy_all

3.times{
  User.create(
    username: Faker::Name.unique.name,
  )
}

3.times{
  Show.create(
    name: Faker::Movie.title,
    genre: Faker::Music.genre,
    premiered: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    image: 'google.com',
    official_site: 'google.com',
  )
}

UserShow.create(
  user_id: User.first.id,
  show_id: Show.first.id,
  notes: Faker::Lorem.sentence,
  rating: rand(1..5),
  status: 'finished watching'
)

UserShow.create(
  user_id: User.first.id,
  show_id: Show.second.id,
  notes: Faker::Lorem.sentence,
  rating: rand(1..5),
  status: 'still watching'
)

UserShow.create(
  user_id: User.second.id,
  show_id: Show.first.id,
  notes: Faker::Lorem.sentence,
  rating: rand(1..5),
  status: 'still watching'
)