require 'rails_helper'

feature 'restaurants' do
  
  context 'no restos added' do
    scenario 'should display prompt for resto addition' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    
    before do
      Restaurant.create(name: 'KFC')
    end

    scenario 'display restos' do
      visit '/restaurants'
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants'
    end

  end

  context 'creating restaurants' do
    scenario 'prompt users to fill out a form, then displays the new reatuarant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end 
  end 
end