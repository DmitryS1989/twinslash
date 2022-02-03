# frozen_string_literal: true

module Admin
  # class
  class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
      authorize %i[admin user]
      @users = User.all.order(created_at: :desc).page params[:page]
    end
  end
end
