# frozen_string_literal: true

# class
class StaticPagesController < ApplicationController
  def home
    @ads = Ad.state_is_puplished.newest_first.page params[:page]
  end

  def about; end
end
