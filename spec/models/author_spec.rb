require 'rails_helper'

RSpec.describe Author do
  describe '#sort_by_created_at' do
    it 'sorts authors by most recently created to oldest' do
      author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35, created_at: Time.now - 1.days)
      author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
      author3 = Author.create!(name: 'James Patterson', living: false, location: "California, USA", years_active: 40, created_at: Time.now - 4.days)
      # require 'pry'; binding.pry
      expect(Author.sort_by_created_at).to eq([author2, author1, author3])
    end
  end

  describe '#count_books' do
    it 'returns number of books by given author' do
      author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
      author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
      book1 = author1.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 223, genre: 'Classics')
      book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')
      book3 = author2.books.create!(name: 'The Pearl', available_as_audiobook: true, page_length: 223, genre: 'Classics')
      book4 = author2.books.create!(name: 'East of Eden', available_as_audiobook: true, page_length: 425, genre: 'Classics')
      
      expect(author1.count_books).to eq(1)
      expect(author2.count_books).to eq(3)
    end
  end
end