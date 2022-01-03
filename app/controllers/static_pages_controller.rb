# frozen_string_literal: true

# class
class StaticPagesController < ApplicationController
  def home
    @ads = Ad.includes_all.state_is_published.newest_first.page params[:page]
  end

  def about; end
end
