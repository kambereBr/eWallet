require 'rails_helper'

RSpec.feature 'Operations', type: :feature do
  let!(:author) do
    User.create(name: 'Bruno', email: 'brunokambere1@gmail.com', password: '123456', confirmed_at: Time.current)
  end

  let!(:group) do
    Group.create(author:, name: 'Group 1', icon: fixture_file_upload('icon.png', 'image/png'))
  end

  before do
    sign_in author
    get group_operations_path(group)
  end

  it 'response body includes correct placeholder text' do
    expect(response.body).to include('Transactions for Group 1')
  end

  it 'response body includes correct button placeholder text' do
    expect(response.body).to include('Add New Transaction')
  end

  it 'redirects to category list page when clicking on Add New Transaction button' do
    find('.btn-success').click
    expect(current_path).to eq(groups_path)
  end
end
