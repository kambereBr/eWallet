require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  let!(:author) do
    User.create(name: 'Bruno', email: 'brunokambere1@gmail.com', password: '123456', confirmed_at: Time.current)
  end

  it 'User logs in' do
    visit '/users/sign_in'
    fill_in 'user_email', with: 'brunokambere1@gmail.com'
    fill_in 'user_password', with: '123456'
    find('.btn-login').click

    expect(page).to have_content('Total amount')
  end
end
