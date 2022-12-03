require 'rails_helper'

RSpec.describe 'creating a new book' do
  it 'has a link to create a book on the author show page' do
    author = Author.create!(name: 'Jonathan Tropper', living: true, location: 'New York', years_active: 12)
    visit "/authors/#{author.id}/books"
    click_link "Create Book"

    expect(current_path).to eq("/authors/#{author.id}/books/new")
  end

  it 'can create a book that appears on the author books page' do
    author = Author.create!(name: 'Jonathan Tropper', living: true, location: 'New York', years_active: 12)
    visit "/authors/#{author.id}/books/new"
    
    fill_in('Name', with: "This is Where I Leave You")
    select('true', from: 'Available as audiobook')
    fill_in('Page length', with: '339')
    fill_in('Genre', with: 'Fiction/Humor')
    click_button('Create Book')

    expect(current_path).to eq("/authors/#{author.id}/books")
    expect(page).to have_content('This is Where I Leave You')
  end
end