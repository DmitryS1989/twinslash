# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user atributes' do
    user = FactoryBot.build(:user)

    it 'Allow user with a name' do
      assert user.valid?
    end

    it 'do not allow a user with an empty name' do
      user.name = ' '
      expect(user.valid?).to eql(false)
    end

    it 'user has default role after create' do
      expect(user.role).to eql('user')
    end
  end
end
