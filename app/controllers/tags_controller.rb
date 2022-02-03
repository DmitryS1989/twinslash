# frozen_string_literal: true

# class
class TagsController < ApplicationController
  def create
    @tag = Tag.new tag_params
    authorize @tag
    flash[:warning] = @tag.errors.full_messages[0] unless @tag.save
    redirect_back fallback_location: root_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    authorize @tag
    if @tag.destroy
      flash[:success] = 'Tag deleted'
    else
      flash[:warning] = 'The tag is used in one of the ads'
    end
    redirect_to admin_tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
