# frozen_string_literal: true

# class
class AdsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :fetch_tags, only: %i[new edit]
  before_action :check_state, only: %i[update edit]

  def index
    @tags = Tag.where(id: params[:tag_ids]) if params[:tag_ids]
    @ads = Ad.all_by_tags(@tags).page params[:page]
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ads.build ad_params
    authorize @ad
    if @ad.save
      redirect_to my_ads_path
    else
      flash.now[:warning] = @ad.errors.full_messages[0]
      render new_ad_path
    end
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    authorize @ad
    if @ad.update(ad_params)
      flash[:success] = 'Ad updated'
      redirect_to my_ads_path
    else
      render 'edit'
      flash[:warning] = @ad.errors.full_messages[0]
    end
  end

  def delete_file
    file = ActiveStorage::Attachment.find(params[:id])
    file.purge
    redirect_back fallback_location: root_path
  end

  def send_to_moderate
    @ad = Ad.find(params[:id])
    authorize @ad
    @ad.moderating!
    redirect_back fallback_location: root_path
  end

  def refresh
    ad = Ad.find(params[:id])
    authorize @ad
    ad.refresh!
    redirect_back fallback_location: root_path
  end

  def approve
    @ad = Ad.find(params[:id])
    authorize @ad
    @ad.approve!
    redirect_back fallback_location: root_path
  end

  def reject
    @ad = Ad.find(params[:id])
    authorize @ad
    @ad.reject!
    redirect_back fallback_location: root_path
  end

  def correct
    ad = Ad.find(params[:id])
    authorize @ad
    ad.correct!
    redirect_back fallback_location: root_path
  end

  def destroy
    @ad = Ad.find(params[:id])
    authorize @ad
    @ad.destroy
    flash[:success] = 'Ad deleted'
    redirect_to my_ads_path
  end

  private

  def ad_params
    params.require(:ad).permit(:title, :state, :body_ad, images: [], tag_ids: [])
  end

  def check_state
    @ad = Ad.find(params[:id])
    return if %w[draft archival].include?(@ad.state)

    redirect_back fallback_location: root_path
  end

  def fetch_tags
    @tags = Tag.all
  end
end
