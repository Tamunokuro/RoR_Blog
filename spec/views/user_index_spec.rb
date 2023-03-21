require 'rails_helper'

RSpec.describe 'users#index', type: :system do
  describe 'users index page' do
    before(:each) do
      User.create(name: 'Aisha', photo: 'https://unsplash.com/photos/7mBictB_urk', bio: 'Accountant', postscounter: 0)
      User.create(name: 'Moses', photo: 'https://unsplash.com/photos/7mBictB_urk', bio: 'none', postscounter: 2)

      visit root_path
    end

    scenario 'I can see the username of all other users.' do
      sleep(5)
      expect(page).to have_content('Aisha')
      expect(page).to have_content('Moses')
    end

    scenario 'I can see the profile picture for each user.' do
      expect(page).to have_selector('img')
    end

    scenario 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts: 2')
    end

    scenario "When I click on a user, I am redirected to that user's show page" do
      visit(root_path)
      click_link('Aisha')
      expect(page).to have_content('Aisha')
    end
  end
end
