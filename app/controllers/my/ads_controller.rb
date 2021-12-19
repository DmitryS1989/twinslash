# frozen_string_literal: true

# module
module My
  # class
  class AdsController < ApplicationController
    before_action :authenticate_user!
    def index
      @ads = Ad.where(user_id: current_user.id).newest_first.page params[:page]
    end
  end
end
