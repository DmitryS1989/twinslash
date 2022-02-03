# frozen_string_literal: true

module Admin
  # class
  class AdsController < ApplicationController
    before_action :authenticate_user!
    def index
      authorize %i[admin user]
      @ads = Ad.state_is_moderating.includes_all.newest_first.page params[:page]
    end
  end
end
