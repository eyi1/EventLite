# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "nina", email: "nina@nina.com", password: "nina123")
User.create(name: "isra", email: "isra@nina.com", password: "isra123")

Event.create(title: "Potluck", location: "MD", starts: DateTime.new, ends: DateTime.new, description: "hello friends")
Event.create(title: "Potluck", location: "MD", starts: DateTime.new, ends: DateTime.new, description: "hello friends")
Event.create(title: "Potluck", location: "MD", starts: DateTime.new, ends: DateTime.new, description: "hello friends")

Attendance.create(user_id: 1, event_id: 1, comment: "hello")
Attendance.create(user_id: 2, event_id: 2, comment: "hi")
Attendance.create(user_id: 2, event_id: 2, comment: "going")
Attendance.create(user_id: 2, event_id: 2, comment: "going")

Comment.create(user_id: 1, event_id: 1, content: 'wow')
Comment.create(user_id: 2, event_id: 3, content: 'hello')
Comment.create(user_id: 1, event_id: 2, content: 'yay') 
Comment.create(user_id: 2, event_id: 3,content: 'hi')

