require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Jennifer Alexis', photo: 'jennifer.jpeg', bio: 'Hair stylist', postscounter: 0) }
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postscounter must be an integer' do
    subject.postscounter = 'string'
    expect(subject).to_not be_valid
  end

  it 'most_recent_posts returns the most recent posts' do
    expect(subject.most_recent_posts).to eq(subject.posts.order(created_at: :desc).limit(5))
  end
end
