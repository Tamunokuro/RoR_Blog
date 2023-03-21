require 'rails_helper'

RSpec.describe 'user#show', type: :feature do
  describe 'show user detail page' do
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
      visit user_path(@user1)
    end

    scenario 'I can see the user name.' do
      expect(page).to have_content('Aisha')
    end

    scenario 'I can see the user photo.' do
      expect(page).to have_selector('img')
    end

    scenario 'I can see the user bio.' do
      expect(page).to have_content('Accountant')
    end

    scenario 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: ')
    end

    scenario 'I can see the user’s first 3 posts.' do
      expect(page).to have_content('This is a post')
      expect(page).to have_content('Tutorial')
      expect(page).to have_content('This is another post')
    end

    scenario 'I can see the number of comments and likes for every post.' do
      expect(page).to have_content('Comments: 0')
      expect(page).to have_content('Likes: 0')
    end

    scenario 'I can see the “See all posts” button.' do
      expect(page).to have_content('See all Post')
    end

    # #############User post page & Post page#####################

    scenario 'When I click see all posts it redirects me to the user post show page' do
      click_button('See all Post')
      expect(page).to have_content('This is a post')
      expect(page).to have_content('This is another post')
    end

    scenario 'When I click on a post, I am redirected to that post’s show page' do
      click_button('See all Post')
      sleep(10)
      expect(page).to have_content('This is a post')
    end

    scenario 'I can see the post title.' do
      visit post_path(@user1.id, @post1.id)
      expect(page).to have_content('This is a post')
    end

    scenario 'I can see the post text.' do
      visit post_path(@user1.id, @post1.id)
      expect(page).to have_content('Accounting made easy')
    end

    scenario 'I can see comment username' do
      visit post_path(@user1.id, @post1.id)
      expect(page).to have_content('Moses')
    end

    scenario 'I can see comment text' do
      visit post_path(@user1.id, @post1.id)
      expect(page).to have_content('Moses:This is great')
    end
  end
end
