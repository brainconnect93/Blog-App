# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# first_user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico', PostsCounter: 0)
# second_user = User.create(Name: 'Lilly', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Poland', PostsCounter: 0)
# third_user = User.create(Name: 'Thomas', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Rwanda', PostsCounter: 0)

Comment.create(post: first_post, user: second_user, text: 'Can we meet in the playground', post_id: 2, user_id: 2)

first_post = Post.create(user: first_user, title: 'DreamLand', text: 'Welcome to the world of wonderLand', comments_counter: 0, likes_counter: 0)