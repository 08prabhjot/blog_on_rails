# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
Post.delete_all

POSTS_NUM = 50

POSTS_NUM.times do
  p = Post.create(
    title: Faker::Name.name,
    body: Faker::Lorem.paragraph
  )
  if p.valid?
    p.comments = rand(0..9).times.map do
      Comment.new(body: Faker::Hacker.say_something_smart)
    end
  end
end