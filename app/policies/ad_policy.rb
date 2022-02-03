# frozen_string_literal: true

# class
class AdPolicy < ApplicationPolicy
  # class
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @user.user?
  end

  def update?
    @user.author?(@ad)
  end

  def destroy?
    @user.author?(@ad)
  end

  def send_to_moderate?
    @user.author?(@ad)
  end

  def refresh?
    @user.author?(@ad)
  end

  def correct?
    @user.author?(@ad)
  end

  def approve?
    @user.admin_user?
  end

  def reject?
    @user.admin_user?
  end
end
