# frozen_string_literal: true

module My
  class AdsController < ApplicationController
    def index
      @ads = Ad.where(user_id: current_user.id).order(created_at: :desc)
    end
  end
end
