require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Aisha', photo: 'https://unsplash.com/photos/7mBictB_urk', bio: 'Accountant',
                         postscounter: 0)
    @user2 = User.create(name: 'Moses', photo: 'https://unsplash.com/photos/7mBictB_urk', bio: 'Engineer',
                         postscounter: 2)
  end

  context 'load user index page' do
    it 'Should see usernames' do
      visit root_path
      expect(page).to have_content('Aisha')
      expect(page).to have_content('Moses')
    end

    it 'Should see user photos' do
      visit root_path
      expect(page).to have_selector('img')
    end

    it 'Should see number of posts' do
      visit root_path
      expect(page).to have_content('Number of posts: 2')
    end

    it 'Should redirect to user posts after username is clicked' do
      visit root_path
      click_link('Aisha')
      expect(page).to have_content('Aisha')
    end
  end
end
