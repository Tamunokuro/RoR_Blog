require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'This is a comment', author_id: 1, post_id: 1) }
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to_not be_valid
  end

  it 'is not valid without a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text must be less than 1000 characters' do
    subject.text = 'a' * 1001
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a post_id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end
end
