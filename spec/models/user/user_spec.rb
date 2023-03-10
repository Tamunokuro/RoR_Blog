require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jennifer Alexis', photo: 'jennifer.jpeg', bio: 'Hair stylist', postscounter: 0) }
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

  it 'postscounter must be greater than or equal to 0' do
    subject.postscounter = -1
    expect(subject).to_not be_valid
  end
end
