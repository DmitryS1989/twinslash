# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Test user controller', type: :request do
  context 'when the user is not logged in ' do
    def self.should_get_user_signup_signin_pages(*links)
      links.each do |a|
        it "#{a} have status 200" do
          get a
          expect(response.status).to eq(200)
        end
      end
    end

    should_get_user_signup_signin_pages '/users/sign_up', '/users/sign_in'

    it 'Trying to get /users/edit' do
      get '/users/edit'
      expect(response.status).to eq(302)
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
  context 'when the user is  logged in as admin ' do
    include Devise::Test::IntegrationHelpers
    before(:each) do
      sign_in FactoryBot.create(:user, role: :admin)
    end
    it 'Trying to get /users/edit' do
      get '/admin/users'
      expect(response.status).to eq(200)
    end
  end
end
