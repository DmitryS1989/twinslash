# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User signup and signin pages returned 200', type: :request do
  def self.should_get_user_signup_signin_pages(*links)
    links.each do |a|
      it "#{a} have status 200" do
        get a
        expect(response.status).to eq(200)
      end
    end
  end
  should_get_user_signup_signin_pages'/users/sign_up', '/users/sign_in'

end
