# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user atributes' do
    user = User.new(name: 'name',
                    email: 'test@test.com',
                    password: 'password')

    it 'Validate user with a name' do
      assert user.valid?
    end

    it "doesn't validate a user with an empty name" do
      user.name = ' '
      expect(user.valid?).to eql(false)
    end
    it 'user has default role' do
      expect(user.role).to eql('user')
    end
  end
end
