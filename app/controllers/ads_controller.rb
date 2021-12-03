# frozen_string_literal: true

class AdsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: %i[destroy edit update]
  def index
    @ads = Ad.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ads.build ad_create_params
    if @ad.save
      redirect_to '/ads'
      flash[:success] = 'Ad createdted'
    else
      render '/ads/new'
    end
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    if @ad.update(ad_update_params)
      flash[:success] = 'Ad updated'
      redirect_to '/ads'
    else
      render 'edit'
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    flash[:success] = 'Ad deleted'
    redirect_to '/ads'
  end

  private

  def ad_create_params
    params.require(:ad).permit(:title, :content)
  end

  def ad_update_params
    params.require(:ad).permit(:title, :content)
  end

  def correct_user
    @ad = current_user.ads.find_by(id: params[:id])
    redirect_to root_url if @ad.nil?
  end
end
