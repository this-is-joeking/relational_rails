require 'rails_helper'

RSpec.describe 'updating a book' do
  it 'has a link on the books show page to update the book' do
    author = Author.create!(name: 'John Knowles', living: false, location: 'West Virginia', years_active: 31)
    book = author.books.create!(name: 'A seprate Piece', available_as_audiobook: true, page_length: 208, genre: 'Classic/Historical Fiction')

    visit "/books/#{ book.id }"
    click_link 'Update Book'

    expect(current_path).to eq("/books/#{ book.id }/edit")
  end

  it 'can update the book attributes' do
    author = Author.create!(name: 'John Knowles', living: false, location: 'West Virginia', years_active: 31)
    book = author.books.create!(name: 'A seprate Piece', available_as_audiobook: false, page_length: 1234, genre: 'Clasorical Fition')
    visit "/books/#{ book.id }/edit"

    fill_in 'name', with: 'A Separate Peace'
    select 'true', from: 'Available as audiobook'
    fill_in 'Page length', with: '208'
    fill_in 'Genre', with: 'Classic/Historical Fiction'
    click_button 'Update Book'

    expect(current_path).to eq("/books/#{ book.id }")
    expect(page).to have_content('A Separate Peace')
    expect(page).to have_content('true')
    expect(page).to have_content('208')
    expect(page).to have_content('Classic/')
  end
end