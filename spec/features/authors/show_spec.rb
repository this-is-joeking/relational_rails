require 'rails_helper'

RSpec.describe 'the authors show page' do
  it 'shows an individual author' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)

    visit "/authors/#{author1.id}"

    expect(page).to have_content(author1.name)
    expect(page).to_not have_content(author2.name)
  end

  it 'shows the attributes of the author' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)

    visit "/authors/#{author1.id}"

    expect(page).to have_content(author1.location)
    expect(page).to have_content(author1.years_active)
    expect(page).to have_content(author1.living)
  end

  it 'shows the number of books by the author' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
    book1 = author1.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 223, genre: 'Classics')
    book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')
    book3 = author2.books.create!(name: 'The Pearl', available_as_audiobook: true, page_length: 223, genre: 'Classics')
    book4 = author2.books.create!(name: 'East of Eden', available_as_audiobook: true, page_length: 425, genre: 'Classics')

    visit "/authors/#{author1.id}"

    expect(page).to have_content("See all 1")

    visit "/authors/#{author2.id}"

    expect(page).to have_content("See all 3")
  end

  it 'has a link to the books index page' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)

    visit "/authors/#{author1.id}"

    expect(page).to have_link('Books', href:"/books")
  end

  it 'has a link to the books authors books page' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    book1 = author1.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 223, genre: 'Classics')

    visit "/authors/#{author1.id}"

    expect(page).to have_link("See all 1 of Charles Dickens's books", href:"/authors/#{author1.id}/books")
  end
end
