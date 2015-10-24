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
highlight1.selector = " BODY. div "
highlight1.text = 'impossible to continue a peace process with Kurdish fighters'
highlight1.hostname = "www.aljazeera.com"
highlight1.port = 80
highlight1.pathname = "/news/2015/07/turkey-erdogan-warns-kurdish-fighters-150728130110904.html"
highlight1.protocol = "http:"
highlight1.start_offset = 10
highlight1.end_offset = 200
highlight1.user = user1
highlight1.save!


highlight2 = Highlight.new
highlight2.selector = "#first > :nth(1)"
highlight2.text = 'eiusmod tempor incididunt'
highlight2.hostname = "localhost"
highlight2.port = 9002
highlight2.pathname = "/~mohammed/index.html"
highlight2.protocol = "http:"
highlight2.start_offset = 8
highlight2.end_offset = 23
highlight2.user = user1
highlight2.save!



