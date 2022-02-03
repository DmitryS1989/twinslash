# frozen_string_literal: true

# class
class UsersController < ApplicationController
  def make_administrator
    authorize User
    @user = User.find(params[:id])
    @user.make_administrator!
    redirect_back fallback_location: root_path, notice: 'User role changed to admin.'
  end

  def make_user
    authorize User
    @user = User.find(params[:id])
    @user.make_user!
    redirect_back fallback_location: root_path, notice: 'User role changed to user.'
  end

  def destroy
    authorize User
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'User deleted.'
  end
end
