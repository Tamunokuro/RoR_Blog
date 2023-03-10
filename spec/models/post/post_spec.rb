require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My first post', comments_counter: 0, likes_counter: 0) }
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to_not be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be an integer' do
    subject.comments_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be an integer' do
    subject.likes_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
