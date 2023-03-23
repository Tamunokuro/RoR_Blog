# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Like.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

# Create Users
user1 = User.create(name: 'Aisha', photo: 'https://unsplash.com/photos/7mBictB_urk', email: 'aisha@gmail.com', bio: 'Accountant',
postscounter: 0)
user2 = User.create(name: 'Moses', photo: 'https://unsplash.com/photos/7mBictB_urk', email: 'moses@gmail.com', bio: 'Engineer',
postscounter: 2)
post1 = Post.create(title: 'This is a post', text: 'Accounting made easy', likes_counter: 0,
comments_counter: 0, author_id: user1.id)
post2 = Post.create(title: 'Engineering post', text: 'How to become a mechanical eng', likes_counter: 0,
comments_counter: 0, author_id: user2.id)
post3 = Post.create(title: 'This is another post', text: 'Benefits of budgeting', likes_counter: 0,
comments_counter: 0, author_id: user1.id)
post4 = Post.create(title: 'Tutorial', text: 'Accounting made easy', likes_counter: 0,
comments_counter: 0, author_id: user1.id)
post5 = Post.create(title: 'Automobile engineering', text: 'Reading', likes_counter: 0,
comments_counter: 0, author_id: user2.id)
Comment.create(text: 'This is great', post_id: post1.id, author_id: user2.id)