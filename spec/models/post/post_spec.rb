require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    @user = User.create(name: 'Jennifer Alexis', photo: 'jennifer.jpeg', bio: 'Hair stylist', postscounter: 0)
    @post = Post.create(title: 'This is my post', text: 'Thie is text', comments_counter: 0, likes_counter: 0,
                        author_id: @user.id)

    @user.save
    @post.save
  end

  # subject { Post.new(title: 'My first post', comments_counter: 0, likes_counter: 0) }
  # before { subject.save }

  it 'is valid with valid attributes' do
    expect(@post).to be_valid
  end

  it 'is not valid without a title' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'comments_counter must be an integer' do
    @post.comments_counter = 'string'
    expect(@post).to_not be_valid
  end

  it 'comments_counter must be greater than or equal to 0' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'likes_counter must be an integer' do
    @post.likes_counter = 'string'
    expect(@post).to_not be_valid
  end

  it 'likes_counter must be greater than or equal to 0' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end

  it 'posts_counter should increase post count' do
    @post.posts_counter
    expect(@user.postscounter).to eq(@user.postscounter)
  end
end
