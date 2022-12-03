require 'rails_helper'

RSpec.describe 'author creation' do
  it 'links to new author from authors index page' do
    visit '/authors'

    click_link('New Author')
    expect(current_path).to eq('/authors/new')
  end

  it 'can create a new author' do
    visit '/authors/new'

    fill_in('Name', with: 'Roald Dahl')
    select('false', from: 'Living')
    fill_in('Location', with: 'UK')
    fill_in('Years active', with: '48')
    click_button('Create Author')

    expect(current_path).to eq('/authors')
    expect(page).to have_content("Roald Dahl")
  end
end