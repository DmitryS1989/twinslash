# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StaticPagesControllers', type: :request do
  def self.should_get_static_page(*links)
    links.each do |a|
      it "#{a} have status 200" do
        get a
        expect(response.status).to eq(200)
      end
    end
  end
  should_get_static_page '/home', '/about'
end
