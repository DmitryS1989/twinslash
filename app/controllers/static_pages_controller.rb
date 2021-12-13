# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @ads = Ad.where(state: :published).order(created_at: :desc).page params[:page]
  end

  def about; end
end
