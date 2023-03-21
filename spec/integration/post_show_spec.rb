require 'rails_helper'

RSpec.describe 'posts#show', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Aisha', photo: 'https://unsplash.com/photos/7mBictB_urk', bio: 'Accountant',
                         postscounter: 0)
    @user2 = User.create(name: 'Moses', photo: 'https://unsplash.com/photos/7mBictB_urk', bio: 'Engineer',
                         postscounter: 2)
    @post1 = Post.create(title: 'This is a post', text: 'Accounting made easy', likes_counter: 0,
                         comments_counter: 0, author_id: @user1.id)
    @post2 = Post.create(title: 'Engineering post', text: 'How to become a mechanical eng', likes_counter: 0,
                         comments_counter: 0, author_id: @user2.id)
    @post3 = Post.create(title: 'This is another post', text: 'Benefits of budgeting', likes_counter: 0,
                         comments_counter: 0, author_id: @user1.id)
    @post4 = Post.create(title: 'Tutorial', text: 'Accounting made easy', likes_counter: 0,
                         comments_counter: 0, author_id: @user1.id)
    @post5 = Post.create(title: 'Automobile engineering', text: 'Reading', likes_counter: 0,
                         comments_counter: 0, author_id: @user2.id)
    Comment.create(text: 'This is great', post_id: @post1.id, author_id: @user2.id)
  end

  context 'Post index page' do
    it 'Should see the user name' do
      visit post_path(@user1.id, @post1.id)
      expect(page).to have_content('This is a post')
      expect(page).to have_content('Accounting made easy')
    end

    it 'Should see number of posts' do
      visit post_path(@user1.id, @post1.id)
      expect(page).to have_content('Comments')
    end

    it 'Should see the users first three posts' do
      visit post_path(@user1.id, @post1.id)
      expect(page).to have_content('This is a post')
      expect(page).to have_content('Accounting made easy')
    end

    it 'Should see the see all posts button' do
      visit post_path(@user1.id, @post1.id)
      expect(page).to have_button('Add Like')
    end

    it 'Should redirect me to the user post show page' do
      visit post_path(@user1.id, @post1.id)
      visit post_path('1', '1')
      expect(page).to have_content('This is my comment')
    end

    it 'Should see the comments' do
      visit post_path(@user1.id, @post1.id)
      expect(page).to have_content('This is great')
    end
  end
end
