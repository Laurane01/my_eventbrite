# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('events')
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')


20.times do

users = User.create!(first_name: Faker::Dog.name, last_name: Faker::Dog.breed, email: Faker::Internet.email, encrypted_password: '123456', description: Faker::Dog.meme_phrase, user_name: Faker::Artist.name)
end

20.times do
events = Event.create!(start_date: Faker::Date.forward, duration: 55, location: Faker::Simpsons.location, description: Faker::HowIMetYourMother.quote, price: rand(1..1000), title: Faker::GreekPhilosophers.quote, admin: User.all.sample)
	
end

20.times do
	attendances = Attendance.create!(user: User.all.sample, event: Event.all.sample)
end