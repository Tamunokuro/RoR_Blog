require 'rails_helper'

RSpec.describe 'user#show', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Aisha', photo: 'https://unsplash.com/photos/7mBictB_urk', bio: 'Accountant',
                         postscounter: 0)
    @user2 = User.create(name: 'Moses', photo: 'https://unsplash.com/photos/7mBictB_urk', bio: 'Engineer',
                         postscounter: 2)
    Post.create(title: 'This is a post', text: 'Accounting made easy', likes_counter: 0,
                comments_counter: 0, author_id: @user1.id)
    Post.create(title: 'Engineering post', text: 'How to become a mechanical eng', likes_counter: 0,
                comments_counter: 0, author_id: @user2.id)
    Post.create(title: 'This is another post', text: 'Benefits of budgeting', likes_counter: 0,
                comments_counter: 0, author_id: @user1.id)
    Post.create(title: 'Tutorial', text: 'Accounting made easy', likes_counter: 0,
                comments_counter: 0, author_id: @user1.id)
    Post.create(title: 'Automobile engineering', text: 'Reading', likes_counter: 0,
                comments_counter: 0, author_id: @user2.id)
  end

  context 'Load show page' do
    it 'Should see user image' do
      visit user_path(@user1.id)
      expect(page).to have_selector('img')
    end

    it 'Should see user name' do
      visit user_path(@user1.id)
      expect(page).to have_content('Aisha')
    end

    it 'Should see user bio' do
      visit user_path(@user1.id)
      expect(page).to have_content('Accountant')
    end

    it 'Should see number of posts' do
      visit user_path(@user1.id)
      expect(page).to have_content('Number of posts: 3')
    end

    it 'Should see the users firsr tree posts' do
      visit user_path(@user1.id)
      expect(page).to have_content('This is a post')
      expect(page).to have_content('This is another post')
      expect(page).to have_content('Tutorial')
    end

    it 'Should see the see posts button' do
      visit user_path(@user1.id)
      expect(page).to have_button('See all Post')
    end
  end
end
