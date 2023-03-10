require 'rails_helper'

RSpec.describe User, Like, type: :model do
  subject { Like.new(author_id: 1, post_id: 1) }
  before { subject.save }

  it 'is valid with valid attributes' do
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
