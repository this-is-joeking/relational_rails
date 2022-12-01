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
end