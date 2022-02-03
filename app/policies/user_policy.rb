# frozen_string_literal: true

# class
class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def make_administrator?
    @current_user.admin_user?
  end

  def make_user?
    @current_user.admin_user?
  end

  def destroy?
    @current_user.admin_user?
  end
end
