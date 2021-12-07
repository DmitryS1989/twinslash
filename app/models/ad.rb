# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :user
  has_many :ad_tags, dependent: :destroy
  has_many :tags, through: :ad_tags
  has_many_attached :images

  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  validates :tags, presence: true
  validates :images, file_size: { less_than_or_equal_to: 1000.kilobytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png'] }

  scope :all_by_tags, lambda { |tags|
    ads = includes(:user)
    ads = if tags
            ads.joins(:tags).where(tags: tags).preload(:tags)
          else
            ads.includes(:ad_tags, :tags)
          end
    ads.order(created_at: :desc)
  }
end
