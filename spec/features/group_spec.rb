require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  let!(:author) do
    User.create(name: 'Bruno', email: 'brunokambere1@gmail.com', password: '123456', confirmed_at: Time.current)
  end

  let!(:group) do
    Group.create(author:, name: 'Group 1', icon: fixture_file_upload('icon.png', 'image/png'))
  end

  before do
    sign_in author
    get '/groups'
  end

  it 'displays the Group\'s name' do
    expect(page).to have_content(group.name)
  end

  it 'displays the total amount' do
    amount = 0.00
    expect(page).to have_content(number_to_currency(amount))
  end

  it 'response body includes correct placeholder text' do
    expect(response.body).to include('New Category')
  end

  it 'redirects to a category new page when clicking on New Category button' do
    find('.btn-fill-width').click
    expect(current_path).to eq(new_group_path)
  end

  it 'redirects to a category transactions list when clicking on a category card' do
    find('.single-category').click
    expect(current_path).to eq(group_operations_path(group))
  end
end
