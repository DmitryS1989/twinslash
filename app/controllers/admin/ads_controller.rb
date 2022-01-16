# frozen_string_literal: true

module Admin
  # class
  class AdsController < ApplicationController
    before_action :authenticate_user!
    before_action :user_admin
    def index
      @ads = Ad.state_is_moderating.includes_all.newest_first.page params[:page]
    end

    private

    def user_admin
      redirect_to root_url unless current_user.admin_user?
    end
  end
end
