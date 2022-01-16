# frozen_string_literal: true

# class
class UsersController < ApplicationController
  def make_administrator
    @user = User.find(params[:id])
    @user.make_administrator!
    redirect_back fallback_location: root_path
  end

  def make_user
    @user = User.find(params[:id])
    @user.make_user!
    redirect_back fallback_location: root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'User deleted.'
  end
end
