require 'rails_helper'

RSpec.describe 'Operations', type: :request do
  let!(:author) do
    User.create(name: 'Bruno', email: 'brunokambere1@gmail.com', password: '123456', confirmed_at: Time.current)
  end
  let!(:group) do
    Group.create(author:, name: 'Group 1', icon: fixture_file_upload('icon.png', 'image/png'))
  end

  describe 'Operations Get/ index' do
    before do
      sign_in author
      get group_operations_path(group)
    end

    it 'returns Operations http success' do
      expect(response).to have_http_status(200)
    end
    it 'renders Operations index template' do
      expect(response).to render_template(:index)
    end
    it 'response body includes correct placeholder text' do
      get groups_path
      expect(response.body).to include(group.name)
    end
  end

  describe 'GET #new' do
    before do
      sign_in author
      get new_group_operation_path(group)
    end
    it 'renders the add a new Operation page' do
      expect(response).to have_http_status(:success)
    end
    it 'response body includes correct placeholder text' do
      expect(response.body).to include('New Operation')
    end
  end
end
