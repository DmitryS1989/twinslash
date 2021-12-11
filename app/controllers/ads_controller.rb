# frozen_string_literal: true

class AdsController < ApplicationController
  before_action :authenticate_user!,except: %i[show index]
  before_action :correct_user, only: %i[destroy edit update]
  before_action :fetch_tags, only: %i[new edit]
  before_action :check_state, only: %i[update edit]

  def index
    params[:tag_ids]
    @tags = Tag.where(id: params[:tag_ids]) if params[:tag_ids]
    @ads = Ad.all_by_tags(@tags)
  end

  def show
    @ads = Ad.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ads.build ad_params
    if @ad.save
      redirect_to '/my/ads'
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
    if @ad.update(ad_params)
      flash[:success] = 'Ad updated'
      redirect_to '/ads'
    else
      render 'edit'
    end
  end
  
  def delete_file
    file = ActiveStorage::Attachment.find(params[:id])
    file.purge
    redirect_back fallback_location: root_path
  end
  def send_to_moderate
    ad = Ad.find(params[:id])
    ad.moderating!
    redirect_back fallback_location: root_path
  end

  def refresh
    ad = Ad.find(params[:id])
    ad.refresh!
    redirect_back fallback_location: root_path
  end

  def correct
    ad = Ad.find(params[:id])
    ad.correct!
    redirect_back fallback_location: root_path
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    flash[:success] = 'Ad deleted'
    redirect_to '/ads'
  end

  private

  def check_state
    @ad = Ad.find(params[:id])
    redirect_back fallback_location: 
             root_path unless %w[draft archival].include?(@ad.state)
  end

  def ad_params
    params.require(:ad).permit(:title, :state, :content, images: [], tag_ids: [])
  end

  def correct_user
    @ad = current_user.ads.find_by(id: params[:id])
    redirect_to root_url if @ad.nil?
  end

  def fetch_tags
    @tags = Tag.all
  end
end
