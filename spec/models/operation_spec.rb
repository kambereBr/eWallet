require 'rails_helper'

RSpec.describe Operation, type: :model do
  it 'Should not be valid without a user object' do
    group = Group.create(name: 'Group 1')
    operation = Operation.new(name: 'My Operation', amount: 75, groups: [group])
    expect(operation).not_to be_valid
  end

  it 'Should not be valid without a name' do
    author = User.create(name: 'Bruno', email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    group = Group.create(author:, name: 'My Group')
    operation = Operation.new(author:, amount: 180, groups: [group])
    expect(operation).not_to be_valid
  end

  it 'Should not be valid without  a group object' do
    author = User.create(name: 'Bruno', email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    operation = Operation.new(author:, name: 'Example Operation', amount: 90)
    expect(operation).not_to be_valid
  end

  it 'Should not be valid without an amount' do
    author = User.create(name: 'Bruno', email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    group = Group.create(author:, name: 'My Group')
    operation = Operation.new(author:, name: 'My Operation', groups: [group])
    expect(operation).not_to be_valid
  end

  it 'Should have group object' do
    author = User.create(name: 'Bruno', email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    group = Group.create(author:, name: 'Example Group')
    operation = Operation.new(author:, name: 'Example Operation', amount: 35, groups: [group])
    expect(operation.groups).to include(group)
  end

  it 'Should not be valid without a user object' do
    author = User.create(name: 'Bruno', email: 'brunokambere@gmail.com', password: '123456', confirmed_at: Time.current)
    group = Group.create(author:, name: 'My Group')
    operation = Operation.new(author:, name: 'My Operation', amount: 35, groups: [group])
    expect(operation.author).to eq(author)
  end
end
