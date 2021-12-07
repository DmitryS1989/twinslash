# frozen_string_literal: true

module Admin
  class TagsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tag!, only: %i[destroy]
    before_action :user_admin?

    def index
      @tags = Tag.order(created_at: :desc)
    end

    def new
      @tag = Tag.new
    end

    def create
      @tag = Tag.new(tag_params)
      if @tag.save
        redirect_to '/admin/tags'
        flash[:success] = 'Tag createdted'
      else
        flash[:danger] = 'The tag must be unique and not empty.'
        render '/admin/tags/new'
      end
    end

    def destroy
      if @tag.ads.empty?
        @tag.destroy
        flash[:success] = 'success delete'
        redirect_to admin_tags_path
      else
        redirect_to '/admin/tags'
        flash[:danger] = 'Tag belong to any add'
      end
    end

    private

    def set_tag!
      @tag = Tag.find params[:id]
    end

    def user_admin?
      unless current_user.admin_role?
        flash[:danger] = 'You must be logged in to access this section'
        redirect_to home_url # прерывает цикл запроса
      end
    end

    def tag_params
      params.require(:tag).permit(:title)
    end
  end
end
