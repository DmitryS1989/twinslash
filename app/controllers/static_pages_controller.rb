# frozen_string_literal: true

# class
class StaticPagesController < ApplicationController
  def home
    @ads = Ad.state_is_published.includes_all.newest_first.page params[:page]
  end

  def about; end
end
