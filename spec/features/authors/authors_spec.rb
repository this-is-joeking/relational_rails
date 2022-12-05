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

    expect(page).to have_link("Edit Charles Dickens")
    expect(page).to have_link("Edit John Steinbeck")
    expect(page).to have_link("Edit James Patterson")

    click_link "Edit Charles Dickens"

    expect(current_path).to eq("/authors/#{author1.id}/edit")
  end
end