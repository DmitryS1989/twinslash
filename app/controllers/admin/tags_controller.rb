# frozen_string_literal: true

module Admin
  # class
  class TagsController < ApplicationController
    before_action :authenticate_user!

    def index
      authorize %i[admin user]
      @tags = Tag.all.order(created_at: :desc).page params[:page]
    end
  end
end
