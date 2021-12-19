# frozen_string_literal: true

# module
module Admin
  # module
  module UsersHelper
    def user_roles
      User.roles.keys
    end
  end
end
