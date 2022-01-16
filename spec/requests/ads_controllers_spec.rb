# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'test ads controller', type: :request do
  let(:ad) { FactoryBot.create(:ad) }
  let(:ad_second) { FactoryBot.build(:ad_second) }
  context 'get /my/ads' do
    it_behaves_like 'unauthenticated user redirected' do
      before { get '/my/ads' }
    end
  end

  context 'get /ads/new' do
    it_behaves_like 'unauthenticated user redirected' do
      before { get '/ads/new' }
    end
  end

  context 'user is logged in as user' do
    include Devise::Test::IntegrationHelpers
    before(:each) do
      sign_in FactoryBot.create(:user)
    end

    it 'Trying to get /ads' do
      get '/ads'
      expect(response.status).to eq(200)
    end

    it 'Trying to get /ads/new' do
      get '/ads/new'
      expect(response.status).to eq(200)
    end

    it 'Trying to get /ads/new' do
      get '/my/ads'
      expect(response.status).to eq(200)
    end
  end
end
