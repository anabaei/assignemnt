# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.destroy_all
Post.destroy_all
Category.destroy_all
User.destroy_all

5.times do
  name =  Faker::Address.state
  Category.create(
    name: name,
    # email: "#{first_name.downcase}-#{last_name.downcase}@example.com",
    # password: PASSWORD
  )
end

5.times do
  email = "amir@gmail.com"
  password = "1234"

  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    email: email,
    password_digest: password
    # email: "#{first_name.downcase}-#{last_name.downcase}@example.com",
    # password: PASSWORD
  )
end

categories = Category.all
users = User.all

20.times do
  body =  Faker::Lorem.paragraphs(rand(2..2)).join(' ')
  title = Faker::Book.title
  Post.create(
    body: body,
    title: title,
    user: users.sample,
    category: categories.sample
    # email: "#{first_name.downcase}-#{last_name.downcase}@example.com",
    # password: PASSWORD
  )
end
posts = Post.all

10.times do
  comment = Comment.create(
    title: Faker::ChuckNorris.fact,
    body: Faker::Lorem.paragraphs(rand(2..3)).join(' '),
    post: posts.sample,
    user: users.sample
  )
end


comments = Comment.all

  puts Cowsay.say("Created #{comments.count} comments", :tux)
  puts Cowsay.say("Created #{users.count} users", :tux)
  puts Cowsay.say("Created #{posts.count} posts", :tux)
