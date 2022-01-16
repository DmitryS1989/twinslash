# frozen_string_literal: true

module Admin
  # class
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :user_admin
    def index
      @users = User.all.order(created_at: :desc).page params[:page]
    end

    private

    def user_admin
      redirect_to root_url unless current_user.admin_user?
    end
  end
end
