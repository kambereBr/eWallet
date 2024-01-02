require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let!(:author) do
    User.create(name: 'Bruno', email: 'brunokambere1@gmail.com', password: '123456', confirmed_at: Time.current)
  end
  let!(:group) do
    Group.create(author:, name: 'Group 1', icon: fixture_file_upload('icon.png', 'image/png'))
  end

  describe 'Categories Get/ index' do
    before do
      sign_in author
      get '/groups'
    end
    it 'returns categories http success' do
      expect(response).to have_http_status(200)
    end
    it 'renders categories index template' do
      expect(response).to render_template(:index)
    end
    it 'response body includes correct placeholder text' do
      get groups_path
      expect(response.body).to include(group.name)
    end
  end

  describe 'Categories Get/ new' do
    before do
      sign_in author
      get '/groups/new'
    end

    it 'returns categories http success' do
      expect(response).to have_http_status(200)
    end
    it 'renders categories new template' do
      expect(response).to render_template(:new)
    end

    it 'response body includes correct placeholder text' do
      get groups_path
      expect(response.body).to include('New Category')
    end
  end
end
