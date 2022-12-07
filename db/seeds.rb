# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
author3 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
author4 = Author.create!(name: 'James Patterson', living: false, location: "California, USA", years_active: 40, created_at: Time.now - 4.days)
author5 = Author.create!(name: 'John Knowles', living: false, location: 'West Virginia', years_active: 31)


book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
book2 = author1.books.create!(name: 'Carrie', available_as_audiobook: false, page_length: 526, genre: 'Horror')
book3 = author1.books.create!(name: 'Wizard and Glass', available_as_audiobook: true, page_length: 657, genre: 'Fantasy/Western')
book4 = author1.books.create!(name: 'THE STAND', available_as_audiobook: true, page_length: 809, genre: 'Fiction')
book5 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: false, page_length: 425, genre: 'Historical Fiction')
book6 = author2.books.create!(name: 'The Pearl', available_as_audiobook: true, page_length: 105, genre: 'Classics')
book7 = author3.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 223, genre: 'Classics')
book8 = author3.books.create!(name: 'A Christmas Carol', available_as_audiobook: true, page_length: 106, genre: 'Classics/Holiday')
book9 = author4.books.create!(name: 'Cross', available_as_audiobook: false, page_length: 389, genre: 'Mystery/Thriller')
book10 = author4.books.create!(name: 'A Separate Peace', available_as_audiobook: true, page_length: 206, genre: 'Historical Fiction')
book11 = author4.books.create!(name: 'Peace Breaks Out', available_as_audiobook: false, page_length: 238, genre: 'Historical Fiction')