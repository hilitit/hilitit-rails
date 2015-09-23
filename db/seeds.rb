# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
user1 = User.new
user1.email = "tillawy@me.com"
user1.password = 'password'
user1.password_confirmation = 'password'
user1.skip_confirmation!
user1.save!

user2 = User.new
user2.email = "tillawy@gmail.com"
user2.password = 'password'
user2.password_confirmation = 'password'
user2.skip_confirmation!
user2.save!

user3 = User.new
user3.email = "api_feed@xflow.io"
user3.password = 'password'
user3.password_confirmation = 'password'
user3.skip_confirmation!
user3.save!



highlight1 = Highlight.new
highlight1.user = user1
highlight1.save!




