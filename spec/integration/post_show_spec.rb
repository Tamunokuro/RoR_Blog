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
    visit post_path(@user1.id, @post1.id)
  end

  context 'Post index page' do
    it 'Should see the post title' do
      expect(page).to have_content('This is a post')
    end

    it 'Should see number of comments' do
      expect(page).to have_content('Comments')
    end

    it 'Should see number of likes' do
      expect(page).to have_content('Likes')
    end

    it 'Should see the post body' do
      expect(page).to have_content('Accounting made easy')
    end

    it 'Should see the commenter username' do
      expect(page).to have_content('Moses')
    end

    it 'Should see comment user left' do
      expect(page).to have_content('This is great')
    end
  end
end
