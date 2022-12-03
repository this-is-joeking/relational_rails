require 'rails_helper'

RSpec.describe 'update an author' do
  it 'has an update link on the author show page' do
    author = Author.create!(name: 'Jonathon Topper', living: true, location: 'New Yok', years_active: 12)
    visit "/authors/#{author.id}"
    click_link 'Update Author'

    expect(current_path).to eq("/authors/#{author.id}/edit")
  end

  it 'can edit the author' do
    author = Author.create!(name: 'Jonathon Topper', living: true, location: 'New Yok', years_active: 12)
    visit "/authors/#{author.id}/edit"

    fill_in 'name', with: 'Jonathan Tropper'
    select('true', from: 'Living')
    fill_in('Location', with: 'Westchester, New York')
    fill_in('Years active', with: '10')
    click_button 'Update Author'

    expect(current_path).to eq("/authors/#{author.id}")
    expect(page).to have_content('Tropper')
    expect(page).to have_content('10')
    expect(page).to have_content('Westchester')
  end

  it 'does not update fields that are left blank on update form' do
    author = Author.create!(name: 'Jonathan Topper', living: true, location: 'New York', years_active: 12)
    visit "/authors/#{author.id}/edit"

    fill_in 'name', with: 'Jonathan Tropper'
    click_button 'Update Author'

    expect(page).to have_content('Tropper')
    expect(page).to have_content('12')
    expect(page).to have_content('New York')
    expect(page).to have_content('true')
  end
end