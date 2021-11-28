require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'name: test' do
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

  end
end
