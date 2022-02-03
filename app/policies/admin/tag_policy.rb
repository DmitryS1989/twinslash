# frozen_string_literal: true

module Admin
  # class
  class TagPolicy < ApplicationPolicy
    def index?
      user.admin_user?
    end
  end
end
