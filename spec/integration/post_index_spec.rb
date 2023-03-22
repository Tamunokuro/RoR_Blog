require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
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
    @comment1 = Comment.create(text: 'This is great', post_id: @post1.id, author_id: @user2.id)
    visit user_path(@user1.id)
  end

  context 'Load index page' do
    it 'Should see the profile picture' do
      expect(page).to have_selector('img')
    end

    it 'Should see the posts author' do
      expect(page).to have_content('Aisha')
    end

    it 'Should see the number of posts' do
      expect(page).to have_content('Number of posts: 4')
    end

    it 'Should see the posts title' do
      expect(page).to have_content('This is a post')
    end

    it 'Should see the number of comments' do
      expect(page).to have_content("Comments: #{@post1.comments_counter}")
    end

    it 'Should see the number of likes' do
      expect(page).to have_content("Likes: #{@post1.likes_counter}")
    end

    it 'Should see some post body and first comment' do
      click_link 'This is a post'
      expect(page).to have_content('Accounting made easy')
      expect(page).to have_content('Moses:This is great')
    end

    it 'Should redirect to post page after post title is clicked' do
      visit(post_path(@user1, @post1))
      expect(page).to have_current_path post_path(@user1, @post1)
    end
  end
end
