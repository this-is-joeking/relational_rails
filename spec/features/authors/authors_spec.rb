require 'rails_helper'

RSpec.describe 'the authors page' do
  it 'displays each author' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
    book1 = author1.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 223, genre: 'Classics')
    book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')

    visit "/authors"

    expect(page).to have_content(author1.name)
    expect(page).to have_content(author2.name)
    expect(page).to_not have_content(book1.name)
  end

  it 'displays the authors created at time' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)

    visit "/authors"

    expect(page).to have_content(author1.created_at)
    expect(page).to have_content(author2.created_at)
  end

  it 'displays authors in order they were created' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
    author3 = Author.create!(name: 'James Patterson', living: false, location: "California, USA", years_active: 40, created_at: Time.now - 4.days)
    
    visit "/authors"

    expect(author2.name).to appear_before(author1.name)
    expect(author2.name).to appear_before(author3.name)
  end

  it 'has a link to the books index page' do
    visit "/authors"

    expect(page).to have_link('Books', href:"/books")
  end

  it 'has a link to edit each author' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
    author3 = Author.create!(name: 'James Patterson', living: false, location: "California, USA", years_active: 40, created_at: Time.now - 4.days)

    visit "/authors"

    expect(page).to have_link("Update Charles Dickens")
    expect(page).to have_link("Update John Steinbeck")
    expect(page).to have_link("Update James Patterson")

    click_link "Update Charles Dickens"

    expect(current_path).to eq("/authors/#{author1.id}/edit")
  end

  it 'has a link to delete each author' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
    author3 = Author.create!(name: 'James Patterson', living: false, location: "California, USA", years_active: 40, created_at: Time.now - 4.days)
    visit "/authors"

    expect(page).to have_link("Delete Charles Dickens")
    expect(page).to have_link("Delete John Steinbeck")
    expect(page).to have_link("Delete James Patterson")

    click_link "Delete Charles Dickens"

    expect(current_path).to eq("/authors")
    expect(page).to_not have_content("Charles Dickens")
  end

  it 'displays the number of books author has' do
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
    book1 = author1.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 223, genre: 'Classics')
    book2 = author2.books.create!(name: 'The Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')
    book3 = author2.books.create!(name: 'The Pearl', available_as_audiobook: true, page_length: 105, genre: 'Classics')

    visit '/authors'

    expect(page).to have_content('1 book(s) by Charles Dickens')
    expect(page).to have_content('2 book(s) by John Steinbeck')
  end

  xit 'has a link that sorts authors by the number of books' do
    author3 = Author.create!(name: 'Brandon Sanderson', living: true, location: "Utah, USA", years_active: 25)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
    author1 = Author.create!(name: 'Charles Dickens', living: false, location: 'England', years_active: 35)
    book1 = author1.books.create!(name: 'Tail of two cities', available_as_audiobook: true, page_length: 223, genre: 'Classics')
    book2 = author2.books.create!(name: 'The Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')
    book3 = author2.books.create!(name: 'The Pearl', available_as_audiobook: true, page_length: 105, genre: 'Classics')
    book4 = author3.books.create!(name: 'Warbreaker', available_as_audiobook: true, page_length: 1207, genre: 'Fantasy')
    book5 = author3.books.create!(name: 'The Way of Kings', available_as_audiobook: true, page_length: 897, genre: 'Fantasy')
    book6 = author3.books.create!(name: 'Skyward', available_as_audiobook: true, page_length: 687, genre: 'Fantasy/YA')

    visit '/authors'
    click_link 'Sort by number of books'

    expect(author3).to appear_before(author2)
    expect(author2).to appear_before(author1)
  end
end