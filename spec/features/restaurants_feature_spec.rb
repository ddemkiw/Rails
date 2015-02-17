require 'rails_helper'

feature 'restaurants' do
  context 'no restos added' do
    scenario 'should display prompt for resto addition' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end
  end
end