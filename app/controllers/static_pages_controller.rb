# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @ads = Ad.order(created_at: :desc)
  end

  def about; end
end
