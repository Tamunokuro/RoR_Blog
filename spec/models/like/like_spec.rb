require 'rails_helper'

RSpec.describe User, Like, type: :model do
  before :all do
    @user = User.create(name: 'Jennifer Alexis', photo: 'jennifer.jpeg', bio: 'Hair stylist', postscounter: 0)
    @post = Post.create(title: 'This is my post', text: 'Thie is text', comments_counter: 0, likes_counter: 0,
                        author_id: @user.id)
    @like = Like.create(author_id: @user.id, post_id: @post.id)

    @user.save
    @post.save
    @like.save
  end

  # subject { Like.new(author_id: 1, post_id: 1) }
  # before { subject.save }

  it 'is valid with valid attributes' do
    expect(@like).to be_valid
  end

  it 'is not valid without a user_id' do
    @like.author_id = nil
    expect(@like).to_not be_valid
  end

  it 'is not valid without a post_id' do
    @like.post_id = nil
    expect(@like).to_not be_valid
  end

  it 'likes_counter should increase like count' do
    @like.likes_counter
    expect(@post.likes_counter).to eq(@post.likes_counter)
  end
end
