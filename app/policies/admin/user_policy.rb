# frozen_string_literal: true

module Admin
  # class
  class UserPolicy < ApplicationPolicy
    def index?
      user.admin_user?
    end
  end
end
