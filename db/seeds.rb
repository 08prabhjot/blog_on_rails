# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
Post.delete_all
User.delete_all

POSTS_NUM = 50
NUM_USER = 10
PASSWORD = 'supersecret'

super_user = User.create(name: 'jon snow', email: 'js@winterfell.gov' , password: PASSWORD )

NUM_USER.times do
  User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: PASSWORD
  )
end

users = User.all

POSTS_NUM.times do
  p = Post.create(
    title: Faker::Name.name,
    body: Faker::Lorem.paragraph,
    user: users.sample
  )
  if p.valid?
    p.comments = rand(0..9).times.map do
      Comment.new(body: Faker::Hacker.say_something_smart, user: users.sample)
    end
  end
end