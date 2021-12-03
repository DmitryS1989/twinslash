# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'test ads controller', type: :request do
  context 'user is not logged in ' do
    def self.should_get_static_page(*links)
      links.each do |a|
        it "#{a} have status 302" do
          get a
          expect(response.status).to eq(302)
        end
      end
    end
    should_get_static_page '/ads/new', '/ads'
  end

  context 'user is  logged in as user ' do
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
  end
end
