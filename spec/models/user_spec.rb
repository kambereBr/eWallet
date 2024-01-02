require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Should have valid attributes' do
    author = User.create(name: 'Bruno', email: 'brunokambere1@gmail.com', password: '123456',
                         confirmed_at: Time.current)
    expect(author).to be_valid
  end

  it 'Should not be valid without a name' do
    author = User.create(name: 'Bruno', email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    expect(author).not_to be_valid
  end

  it 'Should have unique mail address' do
    User.create(name: 'Bruno1', email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    author2 = User.create(name: 'Bruno2', email: 'brunokambere@gmail.com', password: '123456',
                          confirmed_at: Time.current)
    expect(author2).not_to be_valid
  end

  it 'Should not be valid without a mail address' do
    author = User.create(name: 'Bruno', email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    expect(author).not_to be_valid
  end
end
