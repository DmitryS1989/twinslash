# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Test user controller', type: :request do
  context 'get /users/sign_in' do
    it_behaves_like 'unauthenticated user status ok' do
      before { get '/users/sign_in' }
    end
  end

  context 'get /users/sign_up' do
    it_behaves_like 'unauthenticated user status ok' do
      before { get '/users/sign_up' }
    end
  end

  context 'get /user/edit' do
    it_behaves_like 'unauthenticated user redirected' do
      before { get '/users/edit' }
    end
  end

  context 'when the user is  logged in as user ' do
    include Devise::Test::IntegrationHelpers
    before(:each) do
      sign_in FactoryBot.create(:user)
    end
    it 'Trying to get /users/edit' do
      get '/users/edit'
      expect(response.status).to eq(200)
    end
    it 'Trying to get /users/edit' do
      get '/admin/users'
      expect(response.status).to eq(302)
    end
  end
end
