require 'rails_helper'

RSpec.describe Author do
  describe '#only_audio_books' do
    it 'returns books that are avail as audiobooks' do
      author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
      author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
      book1 = author1.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 223, genre: 'Classics')
      book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')
      book3 = author2.books.create!(name: 'The Pearl', available_as_audiobook: false, page_length: 223, genre: 'Classics')
      book4 = author2.books.create!(name: 'East of Eden', available_as_audiobook: false, page_length: 425, genre: 'Classics')

      expect(Book.only_audio_books).to eq([book1, book2])
    end
  end

  describe '#sort_alphabetically' do
    it 'sorts the books alphabetically regardless of case' do
      author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
      author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
      book1 = author1.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 223, genre: 'Classics')
      book2 = author2.books.create!(name: 'The Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')
      book3 = author2.books.create!(name: 'THE PEARL', available_as_audiobook: false, page_length: 223, genre: 'Classics')
      book4 = author2.books.create!(name: 'East of Eden', available_as_audiobook: false, page_length: 425, genre: 'Classics')

      expect(Book.sort_alphabetically).to eq([book4, book1, book2, book3])
    end
  end

  describe '#page_limit' do
    it 'only shows books over given page count' do
      author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
      author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
      book1 = author1.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 100, genre: 'Classics')
      book2 = author2.books.create!(name: 'The Grapes of Wrath', available_as_audiobook: true, page_length: 200, genre: 'Historical Fiction')
      book3 = author2.books.create!(name: 'THE PEARL', available_as_audiobook: false, page_length: 300, genre: 'Classics')
      book4 = author2.books.create!(name: 'East of Eden', available_as_audiobook: false, page_length: 400, genre: 'Classics')

      expect(Book.page_limit(100)).to eq([book1, book2, book3, book4])
      expect(Book.page_limit(201)).to eq([book3, book4])
      expect(Book.page_limit(350)).to eq([book4])
    end
  end
end