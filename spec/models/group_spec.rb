require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'Should have valid attributes' do
    author = User.create(name: 'Bruno', email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    group = Group.new(author:, name: 'Group 1', icon: fixture_file_upload('icon.png', 'image/png'))
    expect(group).to be_valid
  end

  it 'Should not be valid without a user' do
    group = Group.new(name: 'Group 2')
    expect(group).not_to be_valid
  end

  it 'Should not be valid without a name' do
    author = User.create(email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    group = Group.new(author:)
    expect(group).not_to be_valid
  end

  it 'Should have a correct user object' do
    author = User.create(name: 'Bruno', email: 'brunokambere@gmail.com', password: '123456',
                         confirmed_at: Time.current)
    group = Group.new(author:, name: 'Group 3')
    expect(group.author).to eq(author)
  end
end
