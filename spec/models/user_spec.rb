# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  before(:each) do
    user.valid?
  end

  it 'Allow user with a name' do
    expect(user.errors.full_messages).to be_empty
  end

  context 'a user with an empty name' do
    let(:user) { FactoryBot.build(:user, name: ' ') }
    it 'incorrect' do
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
  end

  it 'user has default role after create' do
    expect(user.role).to eql('user')
  end
end
