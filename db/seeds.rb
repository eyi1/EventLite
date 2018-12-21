# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "nina", email: "nina@nina.com", password: "nina123")
User.create(name: "isra", email: "isra@nina.com", password: "isra123")
User.create(name: "mary", email: "mary@mary.com", password: "mary123")
User.create(name: "mimi", email: "mimi@mimi.com", password: "mimi123")
User.create(name: "ralph", email: "ralph@ralph.com", password: "ralph123")

Event.create(title: "Potluck", location: "MD", starts: DateTime.now, ends: DateTime.now, description: "hello friends")
Event.create(title: "Friendsgiving", location: "MD", starts: DateTime.now, ends: DateTime.now, description: "turkey")
Event.create(title: "Bday party", location: "MD", starts: DateTime.now, ends: DateTime.now, description: "hbd")

Attendance.create(user_id: 1, event_id: 1, comment: "hello")
Attendance.create(user_id: 2, event_id: 2, comment: "hi")
Attendance.create(user_id: 2, event_id: 3, comment: "going")
Attendance.create(user_id: 3, event_id: 2, comment: "going")
Attendance.create(user_id: 3, event_id: 3, comment: "going")
Attendance.create(user_id: 4, event_id: 2, comment: "going")
Attendance.create(user_id: 5, event_id: 2, comment: "going")

Comment.create(user_id: 1, event_id: 1, content: 'wow')
Comment.create(user_id: 2, event_id: 3, content: 'hello')
Comment.create(user_id: 1, event_id: 2, content: 'yay') 
Comment.create(user_id: 2, event_id: 3,content: 'hi')

