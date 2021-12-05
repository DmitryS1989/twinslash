# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  has_many_attached :images
  validates :images, file_size: { less_than_or_equal_to: 1000.kilobytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png'] }
end
