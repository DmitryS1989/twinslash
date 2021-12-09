# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :ad_tags, dependent: :restrict_with_error
  has_many :ads, through: :ad_tags, dependent: :restrict_with_error
  validates :title, presence: true, uniqueness: true

  def tag_has_any_ad
    if ads.empty?
      destroy
    else
      flash[:danger] = 'Tag belong to any add'
      false
    end
  end
end
