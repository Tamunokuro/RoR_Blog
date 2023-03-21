require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @user = User.create(name: 'Jennifer Alexis', photo: 'jennifer.jpeg', bio: 'Hair stylist', postscounter: 0)
    @post = Post.create(title: 'This is my post', text: 'Thie is text', comments_counter: 0, likes_counter: 0,
                        author_id: @user.id)
    @comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'This is my comment')

    before { @user.save }
    before { @post.save }
    before { @comment.save }
  end

  it 'is valid with valid attributes' do
    expect(@comment).to be_valid
  end

  it 'is not valid without a text' do
    @comment.text = nil
    expect(@comment).to_not be_valid
  end

  it 'text must be less than 1000 characters' do
    @comment.text = 'a' * 1001
    expect(@comment).to_not be_valid
  end

  it 'is not valid without a user_id' do
    @comment.author_id = nil
    expect(@comment).to_not be_valid
  end

  it 'is not valid without a post_id' do
    @comment.post_id = nil
    expect(@comment).to_not be_valid
  end

  it 'comments_counter should increase comment count' do
    @comment.increment_comments_counter
    expect(@post.comments_counter).to eq(@post.comments_counter)
  end

  it 'comments_counter should decrease comment count' do
    @comment.decrement_comments_counter
    expect(@post.comments_counter).to eq(@post.comments_counter)
  end
end
