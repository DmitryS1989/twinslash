# frozen_string_literal: true

# class
class TagPolicy < ApplicationPolicy
  # class
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @user.admin_user?
  end

  def destroy?
    @user.admin_user?
  end
end
