require 'rails_helper'

RSpec.describe 'books index page' do
  describe 'as a visitor' do
    describe 'when i visit /books' do
      it 'shows each book in the system' do
        author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
        author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
        book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
        book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')

        visit "/books"

        expect(page).to have_content(book1.name)
        expect(page).to have_content(book2.name)
      end

      it 'shows attributes of each book' do
        author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
        author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
        book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
        book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')

        visit "/books"

        expect(page).to have_content(book1.available_as_audiobook)
        expect(page).to have_content(book1.page_length)
        expect(page).to have_content(book1.genre)
        expect(page).to have_content(book1.author.name)
        expect(page).to have_content(book2.available_as_audiobook)
        expect(page).to have_content(book2.page_length)
        expect(page).to have_content(book2.genre)
        expect(page).to have_content(book2.author.name)
      end

      it 'has a link to the authors index page' do   
        visit "/books"
    
        expect(page).to have_link('Authors', href:"/authors")
      end

      it 'only shows books the are available as audiobook' do
        author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
        author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
        book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
        book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: false, page_length: 425, genre: 'Historical Fiction')
        visit "/books"
        
        expect(page).to have_content(book1.name)
        expect(page).to_not have_content(book2.name)        
      end

      it 'For each book there is a link to update the book that takes you to edit' do
        author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
        author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
        book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
        book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')

        visit '/books'

        expect(page).to have_link("Update '#{ book1.name }'")
        expect(page).to have_link("Update '#{ book2.name }'")

        click_link "Update 'The Gunslinger'"

        expect(current_path).to eq("/books/#{ book1.id }/edit")
      end

      it 'has a link to delete each book' do
        author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
        author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
        book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
        book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')

        visit '/books'

        expect(page).to have_link("Delete '#{ book1.name }'")
        expect(page).to have_link("Delete '#{ book2.name }'")

        click_link "Delete 'The Gunslinger'"

        expect(current_path).to eq("/books")
        expect(page).to_not have_content("#{ book1.name }")
      end
    end
  end
end