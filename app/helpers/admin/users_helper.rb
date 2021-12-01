# frozen_string_literal: true

module Admin
  module UsersHelper
    def user_roles
      User.roles.keys
    end
  end
end
