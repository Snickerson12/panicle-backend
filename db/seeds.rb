# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all
Photo.destroy_all
Group.destroy_all
UserGroup.destroy_all

user = User.create(username: 'laura', password_digest: 'laura', location: 'Chicago', bio: 'bio')
user2 = User.create(username: 'carla', password_digest: 'carla', location: 'Chicago', bio: 'bio')
group = Group.create(name: 'test group')
post = Post.create(content: 'post text content', user_id: 4, group_id: 1)
comment = Comment.create(user_id: 1, post_id: 1, content: 'this comment says quality post')
photo = Photo.create(user_id: 1)
user_group = UserGroup.create(user_id: 1, group_id: 1)
